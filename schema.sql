-- Drop existing tables if they exist (to avoid conflicts)
DROP TABLE IF EXISTS GroupMembershipRequests;
DROP TABLE IF EXISTS Posts;
DROP TABLE IF EXISTS Friends;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Users;

-- Create Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Password VARCHAR(255),
    DateAdded TIMESTAMP
);

-- Create Friends table
CREATE TABLE Friends (
    FriendID INT PRIMARY KEY,
    FriendWhoAdded INT,
    FriendBeingAdded INT,
    IsAccepted BOOLEAN,
    DateAdded TIMESTAMP,
    FOREIGN KEY (FriendWhoAdded) REFERENCES Users(UserID),
    FOREIGN KEY (FriendBeingAdded) REFERENCES Users(UserID)
);

-- Create Groups table
CREATE TABLE Groups (
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(255),
    CreatedBy INT,
    DateAdded TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID)
);

-- Create Posts table
CREATE TABLE Posts (
    PostID INT PRIMARY KEY,
    PostDescription VARCHAR(255),
    PostedBy INT,
    IsPublic BOOLEAN,
    IsOnlyForFriends BOOLEAN,
    GroupID INT,
    DatePosted TIMESTAMP,
    FOREIGN KEY (PostedBy) REFERENCES Users(UserID),
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
);

-- Create GroupMembershipRequests table
CREATE TABLE GroupMembershipRequests (
    GroupMembershipRequestsID INT PRIMARY KEY,
    GroupID INT,
    GroupMemberUserID INT,
    IsGroupMembershipAccepted BOOLEAN,
    DateAccepted TIMESTAMP,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (GroupMemberUserID) REFERENCES Users(UserID)
);
