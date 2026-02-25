START TRANSACTION;

INSERT INTO users (username)
VALUES ('ADMIN');

INSERT INTO user_activity_logs(action)
VALUES ('insert_test_data');

COMMIT;