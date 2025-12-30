-- CreateTable
CREATE TABLE `board` (
    `BoardID` INTEGER NOT NULL AUTO_INCREMENT,
    `BoardThumbnail` VARCHAR(255) NULL,
    `CreatorID` INTEGER NULL,
    `Private` BIT(1) NULL,
    `Title` VARCHAR(255) NULL,
    `Description` VARCHAR(255) NULL,
    `BoardContentID` INTEGER NULL,
    `CreatedAt` DATE NULL,
    `UpdatedAt` DATE NULL,

    INDEX `CreatorID`(`CreatorID`),
    PRIMARY KEY (`BoardID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `boardcontent` (
    `BoardContentID` INTEGER NOT NULL AUTO_INCREMENT,
    `BoardID` INTEGER NULL,
    `ContentID` INTEGER NULL,
    `CreateAt` DATE NULL,

    INDEX `BoardID`(`BoardID`),
    INDEX `ContentID`(`ContentID`),
    PRIMARY KEY (`BoardContentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `comment` (
    `CommentID` INTEGER NOT NULL AUTO_INCREMENT,
    `ContentID` INTEGER NULL,
    `CreatorID` INTEGER NULL,
    `ParentID` INTEGER NULL,
    `Text` VARCHAR(255) NULL,
    `CreateAt` DATE NULL,

    INDEX `ContentID`(`ContentID`),
    INDEX `CreatorID`(`CreatorID`),
    PRIMARY KEY (`CommentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `communitygroup` (
    `CommunityID` INTEGER NOT NULL AUTO_INCREMENT,
    `CommunityRoomID` INTEGER NULL,
    `RoomID` INTEGER NULL,
    `CreatedAt` DATE NULL,

    INDEX `RoomID`(`RoomID`),
    PRIMARY KEY (`CommunityID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `content` (
    `ContentID` INTEGER NOT NULL AUTO_INCREMENT,
    `CreatorID` INTEGER NULL,
    `ParentID` INTEGER NULL,
    `Title` VARCHAR(255) NULL,
    `Description` VARCHAR(255) NULL,
    `PostType` VARCHAR(255) NULL,
    `Private` BIT(1) NULL,
    `Views` INTEGER NULL,
    `Likes` INTEGER NULL,
    `Comments` INTEGER NULL,
    `Pins` INTEGER NULL,
    `Reports` INTEGER NULL,
    `AreaID` INTEGER NULL,
    `CreatedAt` DATE NULL,
    `PublishedAt` DATE NULL,
    `Score` FLOAT NULL,

    INDEX `CreatorID`(`CreatorID`),
    PRIMARY KEY (`ContentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `file` (
    `FileID` INTEGER NOT NULL AUTO_INCREMENT,
    `Filepath` VARCHAR(255) NULL,
    `FileType` VARCHAR(255) NULL,
    `ContentID` INTEGER NULL,
    `ContentAreaID` INTEGER NULL,

    INDEX `ContentID`(`ContentID`),
    PRIMARY KEY (`FileID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `follow` (
    `CreatorID` INTEGER NOT NULL,
    `UserID` INTEGER NOT NULL,

    INDEX `UserID`(`UserID`),
    PRIMARY KEY (`CreatorID`, `UserID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `friend` (
    `UserID` INTEGER NOT NULL,
    `OppositeUserID` INTEGER NOT NULL,

    INDEX `OppositeUserID`(`OppositeUserID`),
    PRIMARY KEY (`UserID`, `OppositeUserID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `historycontent` (
    `UserID` INTEGER NOT NULL,
    `ContentID` INTEGER NOT NULL,
    `Reps` INTEGER NULL,
    `Liked` BIT(1) NULL,
    `Pinned` BIT(1) NULL,

    INDEX `ContentID`(`ContentID`),
    PRIMARY KEY (`UserID`, `ContentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `message` (
    `MessageID` INTEGER NOT NULL AUTO_INCREMENT,
    `RoomID` INTEGER NULL,
    `ContentID` INTEGER NULL,
    `MediaURL` VARCHAR(255) NULL,
    `MediaType` INTEGER NULL,
    `CreateAt` DATE NULL,
    `SenderName` VARCHAR(255) NULL,
    `SenderProfile` INTEGER NULL,
    `SenderID` INTEGER NULL,

    INDEX `RoomID`(`RoomID`),
    INDEX `SenderID`(`SenderID`),
    PRIMARY KEY (`MessageID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notification` (
    `NotificationID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER NULL,
    `SenderID` INTEGER NULL,
    `Seen` BIT(1) NULL,
    `Title` VARCHAR(255) NULL,
    `Description` VARCHAR(255) NULL,
    `CreatedAt` DATE NULL,

    INDEX `SenderID`(`SenderID`),
    INDEX `UserID`(`UserID`),
    PRIMARY KEY (`NotificationID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `participant` (
    `ParticipantID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER NULL,
    `RoomID` INTEGER NULL,
    `Role` VARCHAR(255) NULL,
    `JoinedAt` DATE NULL,

    INDEX `RoomID`(`RoomID`),
    INDEX `UserID`(`UserID`),
    PRIMARY KEY (`ParticipantID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `report` (
    `ReportID` INTEGER NOT NULL AUTO_INCREMENT,
    `CreatorID` INTEGER NULL,
    `UserID` INTEGER NULL,
    `Description` VARCHAR(255) NULL,
    `Type` VARCHAR(255) NULL,
    `Active` BIT(1) NULL,
    `CreateAt` DATE NULL,

    INDEX `CreatorID`(`CreatorID`),
    INDEX `UserID`(`UserID`),
    PRIMARY KEY (`ReportID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `room` (
    `RoomID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NULL,
    `PictureURL` VARCHAR(255) NULL,
    `Type` VARCHAR(255) NULL,
    `CreatedAt` DATE NULL,
    `UpdatedAt` DATE NULL,

    PRIMARY KEY (`RoomID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `UserID` INTEGER NOT NULL AUTO_INCREMENT,
    `Username` VARCHAR(255) NULL,
    `Password` VARCHAR(255) NULL,
    `Description` VARCHAR(255) NULL,
    `ProfilePicture` VARCHAR(255) NULL,
    `Followers` INTEGER NULL,
    `TotalLikes` INTEGER NULL,
    `TotalReports` INTEGER NULL,
    `PrivateContent` BIT(1) NULL,
    `PrivatePinned` BIT(1) NULL,
    `PrivateLike` BIT(1) NULL,
    `LikeNotification` BIT(1) NULL,
    `CommentNotification` BIT(1) NULL,
    `FollowNotification` BIT(1) NULL,
    `AreaID` INTEGER NULL,

    PRIMARY KEY (`UserID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `board` ADD CONSTRAINT `board_ibfk_1` FOREIGN KEY (`CreatorID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `boardcontent` ADD CONSTRAINT `boardcontent_ibfk_1` FOREIGN KEY (`BoardID`) REFERENCES `board`(`BoardID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `boardcontent` ADD CONSTRAINT `boardcontent_ibfk_2` FOREIGN KEY (`ContentID`) REFERENCES `content`(`ContentID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `comment` ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`ContentID`) REFERENCES `content`(`ContentID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `comment` ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`CreatorID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `communitygroup` ADD CONSTRAINT `communitygroup_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room`(`RoomID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `content` ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`CreatorID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `file` ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`ContentID`) REFERENCES `content`(`ContentID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `follow` ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`CreatorID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `follow` ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `friend` ADD CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `friend` ADD CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`OppositeUserID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `historycontent` ADD CONSTRAINT `historycontent_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `historycontent` ADD CONSTRAINT `historycontent_ibfk_2` FOREIGN KEY (`ContentID`) REFERENCES `content`(`ContentID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `message` ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room`(`RoomID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `message` ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`SenderID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `notification` ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `notification` ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`SenderID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `participant` ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `participant` ADD CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `room`(`RoomID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `report` ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`CreatorID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `report` ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

