-- Users Table
CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Auto-increment primary key in SQL Server
    name NVARCHAR(255) NOT NULL,
    role NVARCHAR(50) CHECK (role IN ('student', 'teacher')), -- ENUM replacement using CHECK constraint
    created_at DATETIME DEFAULT GETDATE()
);

-- Quizzes Table
CREATE TABLE Quizzes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    teacher_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Quizzes_Teacher FOREIGN KEY (teacher_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Questions Table
CREATE TABLE Questions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    quiz_id INT NOT NULL,
    text NVARCHAR(MAX) NOT NULL,
    CONSTRAINT FK_Questions_Quiz FOREIGN KEY (quiz_id) REFERENCES Quizzes(id) ON DELETE CASCADE
);

-- Options Table
CREATE TABLE Options (
    id INT IDENTITY(1,1) PRIMARY KEY,
    question_id INT NOT NULL,
    text NVARCHAR(MAX) NOT NULL,
    is_correct BIT DEFAULT 0, -- BOOLEAN is replaced with BIT in SQL Server
    CONSTRAINT FK_Options_Question FOREIGN KEY (question_id) REFERENCES Questions(id) ON DELETE CASCADE
);

-- Student_Answers Table
CREATE TABLE Student_Answers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    quiz_id INT NOT NULL,
    question_id INT NOT NULL,
    option_id INT NOT NULL,
    CONSTRAINT FK_StudentAnswers_Student FOREIGN KEY (student_id) REFERENCES Users(id) ON DELETE NO ACTION,
    CONSTRAINT FK_StudentAnswers_Quiz FOREIGN KEY (quiz_id) REFERENCES Quizzes(id) ON DELETE NO ACTION, 
    CONSTRAINT FK_StudentAnswers_Question FOREIGN KEY (question_id) REFERENCES Questions(id) ON DELETE NO ACTION,
    CONSTRAINT FK_StudentAnswers_Option FOREIGN KEY (option_id) REFERENCES Options(id) ON DELETE CASCADE
);
