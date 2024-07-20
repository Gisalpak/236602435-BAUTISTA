-- Create a table
CREATE TABLE Users (
    ID int,
    Name varchar(255),
    Email varchar(255)
);

-- Insert data into the table
INSERT INTO Users (ID, Name, Email) VALUES (1, 'John Doe', 'john@example.com');
INSERT INTO Users (ID, Name, Email) VALUES (2, 'Jane Smith', 'jane@example.com');

-- Select data from the table
SELECT * FROM Users;
 