# Quiz App Database Design

This repository contains the database design and implementation script for a Quiz Application built on **SQL Server**. The database is structured to manage users (students and teachers), quizzes, questions, options, and student responses efficiently.

---

## 📋 Features

- **User Management**: 
  - Teachers can create and manage quizzes.
  - Students can participate in quizzes.
  
- **Quiz Management**:
  - Each quiz is associated with a teacher.
  - Quizzes can have multiple questions.

- **Question and Option Management**:
  - Each question belongs to a specific quiz.
  - Questions can have multiple answer options, with at least one correct answer.

- **Answer Tracking**:
  - Students can attempt each quiz only once.
  - Tracks student answers for each question.

---

## 🗂 Database Schema

### **Tables**
1. **Users**
   - Stores details of students and teachers.
   - Columns: `id`, `name`, `role`, `created_at`.

2. **Quizzes**
   - Represents quizzes created by teachers.
   - Columns: `id`, `title`, `teacher_id`, `created_at`.

3. **Questions**
   - Contains questions for each quiz.
   - Columns: `id`, `quiz_id`, `text`.

4. **Options**
   - Stores answer options for questions.
   - Columns: `id`, `question_id`, `text`, `is_correct`.

5. **Student_Answers**
   - Tracks student responses.
   - Columns: `id`, `student_id`, `quiz_id`, `question_id`, `option_id`.

---

## ⚙️ SQL Server Script

The implementation script can be found in the `scripts` folder. It includes:
- Table creation statements with primary and foreign key constraints.
- Relationships configured to maintain data integrity.

---

## 🚀 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/quiz-app-database.git
