-- Insert random data into Users table
INSERT INTO Users (UserID, Username, FirstName, LastName, DateOfBirth, Password, DateAdded)
SELECT 
    ABS(RANDOM() % 100), -- Random UserID
    'user' || ABS(RANDOM() % 100), -- Random username
    'First' || ABS(RANDOM() % 100), -- Random first name
    'Last' || ABS(RANDOM() % 100), -- Random last name
    DATE('1990-01-01', '+' || ABS(RANDOM() % 10000) || ' days'), -- Random date of birth
    'password' || ABS(RANDOM() % 1000), -- Random password
    DATETIME('now') -- Current timestamp for DateAdded
FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5); -- Generate 5 users

-- Insert random data into Groups table
INSERT INTO Groups (GroupID, GroupName, CreatedBy, DateAdded)
SELECT 
    ABS(RANDOM() % 100), -- Random GroupID
    'Group ' || ABS(RANDOM() % 100), -- Random group name
    (SELECT UserID FROM Users ORDER BY RANDOM() LIMIT 1), -- Random valid UserID from Users as CreatedBy
    DATETIME('now') -- Current timestamp for DateAdded
FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3); -- Generate 3 groups

-- Insert random data into Friends table
INSERT INTO Friends (FriendID, FriendWhoAdded, FriendBeingAdded, IsAccepted, DateAdded)
SELECT 
    ABS(RANDOM() % 100), -- Random FriendID
    (SELECT UserID FROM Users ORDER BY RANDOM() LIMIT 1), -- Random FriendWhoAdded from Users
    (SELECT UserID FROM Users ORDER BY RANDOM() LIMIT 1), -- Random FriendBeingAdded from Users
    RANDOM() % 2, -- Random boolean for IsAccepted (0 or 1)
    DATETIME('now') -- Current timestamp for DateAdded
FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5); -- Generate 5 friends

-- Insert random data into Post table
INSERT INTO Post (PostID, PostDescription, PostedBy, IsPublic, IsOnlyForFriends, GroupID, DatePosted)
SELECT 
    ABS(RANDOM() % 100), -- Random PostID
    'Post ' || ABS(RANDOM() % 100), -- Random post description
    (SELECT UserID FROM Users ORDER BY RANDOM() LIMIT 1), -- Random PostedBy from Users
    RANDOM() % 2, -- Random boolean for IsPublic (0 or 1)
    RANDOM() % 2, -- Random boolean for IsOnlyForFriends (0 or 1)
    (SELECT GroupID FROM Groups ORDER BY RANDOM() LIMIT 1), -- Random GroupID from Groups
    DATETIME('now') -- Current timestamp for DatePosted
FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5); -- Generate 5 posts

-- Insert random data into GroupMembershipRequests table
INSERT INTO GroupMembershipRequests (GroupMembershipRequestsID, GroupID, GroupMemberUserID, IsGroupMembershipAccepted, DateAccepted)
SELECT 
    ABS(RANDOM() % 100), -- Random GroupMembershipRequestsID
    (SELECT GroupID FROM Groups ORDER BY RANDOM() LIMIT 1), -- Random GroupID from Groups
    (SELECT UserID FROM Users ORDER BY RANDOM() LIMIT 1), -- Random GroupMemberUserID from Users
    RANDOM() % 2, -- Random boolean for IsGroupMembershipAccepted (0 or 1)
    DATETIME('now') -- Current timestamp for DateAccepted
FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5); -- Generate 5 membership requests

-- Retrieve data: List all Users
SELECT * FROM Users;

-- Retrieve data: List all Posts made by a specific User
SELECT * FROM Post
WHERE PostedBy = 1;

-- Retrieve data: List all Friends for a specific User
SELECT * FROM Friends
WHERE FriendWhoAdded = 1 OR FriendBeingAdded = 1;

-- Retrieve data: List all Groups a User is part of
SELECT g.GroupName
FROM Groups g
JOIN GroupMembershipRequests gmr ON g.GroupID = gmr.GroupID
WHERE gmr.GroupMemberUserID = 2 AND gmr.IsGroupMembershipAccepted = 1;

-- Retrieve data: Find all public posts
SELECT * FROM Post
WHERE IsPublic = 1;

-- Retrieve data: List all pending friend requests
SELECT * FROM Friends
WHERE IsAccepted = 0;
