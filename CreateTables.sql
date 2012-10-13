CREATE TABLE Stage
(
	id int,
	status int
);

CREATE TABLE StageDefinition
(
stageid int,
itemid int,
panel int,
positionX int,
positionY int,
item int,
type int,
direction int
);

CREATE TABLE StageRecord
(
stageid int,
itemid int,
panel int,
positionX int,
positionY int,
item int,
type int,
direction int
);

-- Stage 1
INSERT INTO Stage (id, status) VALUES (1, 0);

INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (1, 1, 0, 1, 5, 2, 1, 2);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (1, 2, 0, 7, 8, 1, 1, 0);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (1, 3, 1, 0, 4, 0, 0, 2);

INSERT INTO Stage (id, status) VALUES (2, 0);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (2, 1, 0, 1, 4, 2, 1, 2);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (2, 2, 0, 5, 3, 1, 4, 0);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (2, 3, 0, 6, 6, 1, 1, 0);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (2, 4, 0, 10, 6, 2, 4, 6);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (2, 5, 1, 0, 5, 0, 0, 3);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (2, 6, 1, 1, 5, 0, 0, 3);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (2, 7, 1, 2, 5, 0, 0, 3);


INSERT INTO Stage (id, status) VALUES (3, 0);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (3, 1, 0, 0, 9, 2, 4, 3);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (3, 2, 0, 3, 0, 2, 2, 1);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (3, 3, 0, 11, 2, 2, 1, 6);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (3, 7, 0, 6, 5, 1, 5, 0);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (3, 8, 0, 8, 7, 1, 6, 0);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (3, 9, 0, 6, 9, 1, 3, 0);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (3, 4, 1, 0, 5, 0, 0, 3);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (3, 5, 1, 1, 5, 0, 0, 3);
INSERT INTO StageDefinition (stageid, itemid, panel, positionX, positionY, item, type, direction)
VALUES (3, 6, 1, 2, 5, 0, 0, 3);

