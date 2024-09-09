-- Create Users table
CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY,
    Username TEXT,
    FirstName TEXT,
    LastName TEXT,
    DateOfBirth DATE,
    Password TEXT,
    DateAdded DATETIME
);

-- Create Friends table
CREATE TABLE Friends (
    FriendID INTEGER PRIMARY KEY,
    FriendWhoAdded INTEGER,
    FriendBeingAdded INTEGER,
    IsAccepted BOOLEAN,
    DateAdded DATETIME,
    FOREIGN KEY (FriendWhoAdded) REFERENCES Users(UserID),
    FOREIGN KEY (FriendBeingAdded) REFERENCES Users(UserID)
);

-- Create Groups table
CREATE TABLE Groups (
    GroupID INTEGER PRIMARY KEY,
    GroupName TEXT,
    CreatedBy INTEGER,
    DateAdded DATETIME,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID)
);

-- Create Post table
CREATE TABLE Post (
    PostID INTEGER PRIMARY KEY,
    PostDescription TEXT,
    PostedBy INTEGER,
    IsPublic BOOLEAN,
    IsOnlyForFriends BOOLEAN,
    GroupID INTEGER,
    DatePosted DATETIME,
    FOREIGN KEY (PostedBy) REFERENCES Users(UserID),
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
);

-- Create GroupMembershipRequests table
CREATE TABLE GroupMembershipRequests (
    GroupMembershipRequestsID INTEGER PRIMARY KEY,
    GroupID INTEGER,
    GroupMemberUserID INTEGER,
    IsGroupMembershipAccepted BOOLEAN,
    DateAccepted DATETIME,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (GroupMemberUserID) REFERENCES Users(UserID)
);
