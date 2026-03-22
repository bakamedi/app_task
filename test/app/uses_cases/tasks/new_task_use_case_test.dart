import 'dart:typed_data';

import 'package:app_task/app/core/either/either.dart';
import 'package:app_task/app/core/success/success.dart';
import 'package:app_task/app/domain/defs/task_creation_source.dart';
import 'package:app_task/app/domain/models/task/task_model.dart';
import 'package:app_task/app/domain/repositories/google_text_recognition_repository.dart';
import 'package:app_task/app/domain/repositories/task_repository.dart';
import 'package:app_task/app/domain/uses_cases/tasks/new/new_task_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mocktail/mocktail.dart';
import 'package:signature/signature.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

class MockGoogleTextRecognitionRepository extends Mock
    implements GoogleTextRecognitionRepository {}

class MockSignatureController extends Mock implements SignatureController {}

void main() {
  late MockTaskRepository mockRepository;
  late MockGoogleTextRecognitionRepository mockGoogleTextRepo;
  late NewTaskUseCase newTaskUseCase;

  setUpAll(() {
    registerFallbackValue(
      const Task(
        id: '',
        title: '',
        description: '',
        order: 0,
        completed: false,
        createdAt: '',
      ),
    );
    registerFallbackValue(TextRecognitionScript.latin);
  });

  setUp(() {
    mockRepository = MockTaskRepository();
    mockGoogleTextRepo = MockGoogleTextRecognitionRepository();
    newTaskUseCase = NewTaskUseCase(
      taskRepository: mockRepository,
      googleTextRecognitionRepository: mockGoogleTextRepo,
    );
  });

  group('NewTaskUseCase', () {
    test('should call addTask on repository when source is TaskFromForm',
        () async {
      // Arrange
      const task = Task(
        id: '1',
        title: 'New Task',
        description: 'Description',
        order: 1,
        completed: false,
        createdAt: '2025-01-01',
      );

      when(() => mockRepository.addTask(any()))
          .thenAnswer((_) async => const Either.right(Success()));

      // Act
      await newTaskUseCase(const TaskFromForm(task));

      // Assert
      verify(() => mockRepository.addTask(task)).called(1);
    });

    test(
        'should process signature and call addTask on repository when source is TaskFromWriting',
        () async {
      // Arrange
      final mockSignature = MockSignatureController();
      const task = Task(
        id: '1',
        title: 'New Task',
        description: '',
        order: 1,
        completed: false,
        createdAt: '2025-01-01',
      );
      final bytes = Uint8List.fromList([1, 2, 3]);

      when(() => mockSignature.toPngBytes()).thenAnswer((_) async => bytes);
      when(() => mockGoogleTextRepo.processImageToText(
            bytes: any(named: 'bytes'),
            textScript: any(named: 'textScript'),
          )).thenAnswer((_) async => 'Recognized text');
      when(() => mockRepository.addTask(any()))
          .thenAnswer((_) async => const Either.right(Success()));

      // Act
      await newTaskUseCase(TaskFromWriting(task: task, signature: mockSignature));

      // Assert
      verify(() => mockSignature.toPngBytes()).called(1);
      verify(() => mockGoogleTextRepo.processImageToText(
            bytes: bytes,
            textScript: TextRecognitionScript.latin,
          )).called(1);
      
      // Capture the task added to repository to verify it has the recognized text
      final capturedTask = verify(() => mockRepository.addTask(captureAny())).captured.first as Task;
      expect(capturedTask.description, 'Recognized text');
      expect(capturedTask.title, task.title);
    });
  });
}
