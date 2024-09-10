-- Inserting Users
INSERT INTO Users (UserID, Username, FirstName, LastName, DateOfBirth, Password, DateAdded)
VALUES
(1, 'jdoe', 'John', 'Doe', '1990-05-15', 'pass123', '2024-01-01 10:00:00'),
(2, 'asmith', 'Alice', 'Smith', '1985-10-30', 'alicepass', '2024-02-05 11:30:00'),
(3, 'bwayne', 'Bruce', 'Wayne', '1980-01-17', 'darkknight', '2024-03-12 14:00:00'),
(4, 'ckent', 'Clark', 'Kent', '1978-06-18', 'superman', '2024-04-22 09:45:00'),
(5, 'rlee', 'Rachel', 'Lee', '2001-02-14', 'rachelpass', '2024-05-10 10:00:00'),
(6, 'kthompson', 'Kyle', 'Thompson', '2003-07-25', 'kylepass', '2024-05-11 12:00:00'),
(7, 'ljones', 'Linda', 'Jones', '1995-08-12', 'lindapass', '2024-05-12 08:00:00');

-- Inserting Friends
INSERT INTO Friends (FriendID, FriendWhoAdded, FriendBeingAdded, IsAccepted, DateAdded)
VALUES
(1, 1, 2, TRUE, '2024-03-15 12:00:00'),
(2, 1, 3, TRUE, '2024-03-17 16:00:00'),
(3, 2, 4, FALSE, '2024-04-01 09:00:00'),
(4, 2, 1, TRUE, '2024-04-15 15:00:00'),
(5, 1, 3, TRUE, '2024-04-20 11:00:00'),
(6, 1, 2, FALSE, '2024-05-01 09:30:00');

-- Inserting Groups
INSERT INTO Groups (GroupID, GroupName, CreatedBy, DateAdded)
VALUES
(1, 'Justice League', 4, '2024-01-10 08:00:00'),
(2, 'Wayne Enterprises', 3, '2024-02-20 13:45:00'),
(3, 'Avengers', 5, '2024-05-14 12:00:00');

-- Inserting Posts
INSERT INTO Posts (PostID, PostDescription, PostedBy, IsPublic, IsOnlyForFriends, GroupID, DatePosted)
VALUES
(1, 'The world needs heroes!', 4, TRUE, FALSE, 1, '2024-03-01 14:00:00'),
(2, 'A brighter Gotham awaits.', 3, FALSE, TRUE, 2, '2024-03-05 09:30:00'),
(3, 'Meeting tonight at 8 PM.', 1, TRUE, FALSE, NULL, '2024-03-10 18:00:00'),
(4, 'I love Metropolis!', 4, TRUE, FALSE, NULL, '2024-03-11 10:00:00'),
(5, 'Wayne Enterprises board meeting.', 4, FALSE, TRUE, 2, '2024-03-15 13:00:00'),
(6, 'Gotham needs me.', 3, FALSE, TRUE, 2, '2024-03-16 14:00:00');

-- Inserting Group Membership Requests
INSERT INTO GroupMembershipRequests (GroupMembershipRequestsID, GroupID, GroupMemberUserID, IsGroupMembershipAccepted, DateAccepted)
VALUES
(1, 1, 1, TRUE, '2024-03-20 10:00:00'),
(2, 1, 3, TRUE, '2024-03-21 11:00:00'),
(3, 2, 4, FALSE, NULL),
(4, 1, 2, TRUE, '2024-04-10 10:00:00'),
(5, 2, 2, FALSE, NULL);
