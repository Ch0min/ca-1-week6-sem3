SET
    @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET
    @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET
    @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema startcode
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `startcode`;

-- -----------------------------------------------------
-- Schema startcode
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `startcode` DEFAULT CHARACTER SET utf8mb3;
USE
    `startcode`;

-- -----------------------------------------------------
-- Table `startcode`.`CITYINFO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `startcode`.`CITYINFO`;

CREATE TABLE IF NOT EXISTS `startcode`.`CITYINFO`
(
    `zip`
        INT
                    NOT
                        NULL,
    `city`
        VARCHAR(45) NULL DEFAULT NULL,
    PRIMARY KEY
        (
         `zip`
            )
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `startcode`.`ADDRESS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `startcode`.`ADDRESS`;

CREATE TABLE IF NOT EXISTS `startcode`.`ADDRESS`
(
    `address_id`
          INT
                      NOT
                          NULL
        AUTO_INCREMENT,
    `street`
          VARCHAR(45) NULL DEFAULT NULL,
    `zip` INT         NOT NULL,
    PRIMARY KEY
        (
         `address_id`,
         `zip`
            ),
    INDEX `fk_ADDRESS_CITYINFO1_idx`
        (
         `zip` ASC
            ) VISIBLE,
    CONSTRAINT `fk_ADDRESS_CITYINFO1`
        FOREIGN KEY
            (
             `zip`
                )
            REFERENCES `startcode`.`CITYINFO`
                (
                 `zip`
                    )
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `startcode`.`HOBBY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `startcode`.`HOBBY`;

CREATE TABLE IF NOT EXISTS `startcode`.`HOBBY`
(
    `hobby_id`
               INT
                            NOT
                                NULL
        AUTO_INCREMENT,
    `name`
               VARCHAR(255) NULL DEFAULT NULL,
    `wikiLink` VARCHAR(255) NULL DEFAULT NULL,
    `category` VARCHAR(255) NULL DEFAULT NULL,
    `type`     VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY
        (
         `hobby_id`
            )
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 452
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `startcode`.`PERSON`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `startcode`.`PERSON`;

CREATE TABLE IF NOT EXISTS `startcode`.`PERSON`
(
    `person_id`
                 INT
                              NOT
                                  NULL
        AUTO_INCREMENT,
    `email`
                 VARCHAR(255) NULL DEFAULT NULL,
    `first_name` VARCHAR(45)  NULL DEFAULT NULL,
    `last_name`  VARCHAR(45)  NULL DEFAULT NULL,
    `address_id` INT          NOT NULL,
    PRIMARY KEY
        (
         `person_id`,
         `address_id`
            ),
    INDEX `fk_PERSON_ADDRESS1_idx`
        (
         `address_id` ASC
            ) VISIBLE,
    CONSTRAINT `fk_PERSON_ADDRESS1`
        FOREIGN KEY
            (
             `address_id`
                )
            REFERENCES `startcode`.`ADDRESS`
                (
                 `address_id`
                    )
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `startcode`.`PERSON_HOBBY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `startcode`.`PERSON_HOBBY`;

CREATE TABLE IF NOT EXISTS `startcode`.`PERSON_HOBBY`
(
    `person_id`
        INT
        NOT
            NULL,
    `hobby_id`
        INT
        NOT
            NULL,
    PRIMARY
        KEY
        (
         `person_id`,
         `hobby_id`
            ),
    INDEX `fk_PERSON_has_HOBBY_HOBBY1_idx`
        (
         `hobby_id` ASC
            ) VISIBLE,
    INDEX `fk_PERSON_has_HOBBY_PERSON_idx`
        (
         `person_id` ASC
            ) VISIBLE,
    CONSTRAINT `fk_PERSON_has_HOBBY_HOBBY1`
        FOREIGN KEY
            (
             `hobby_id`
                )
            REFERENCES `startcode`.`HOBBY`
                (
                 `hobby_id`
                    ),
    CONSTRAINT `fk_PERSON_has_HOBBY_PERSON`
        FOREIGN KEY
            (
             `person_id`
                )
            REFERENCES `startcode`.`PERSON`
                (
                 `person_id`
                    )
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `startcode`.`PHONE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `startcode`.`PHONE`;

CREATE TABLE IF NOT EXISTS `startcode`.`PHONE`
(
    `phoneNumber`
                INT
                            NOT
                                NULL,
    `description`
                VARCHAR(45) NULL DEFAULT NULL,
    `person_id` INT         NOT NULL,
    PRIMARY KEY
        (
         `phoneNumber`,
         `person_id`
            ),
    INDEX `fk_PHONE_PERSON1_idx`
        (
         `person_id` ASC
            ) VISIBLE,
    CONSTRAINT `fk_PHONE_PERSON1`
        FOREIGN KEY
            (
             `person_id`
                )
            REFERENCES `startcode`.`PERSON`
                (
                 `person_id`
                    )
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


SET
    SQL_MODE = @OLD_SQL_MODE;
SET
    FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET
    UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;


INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('3D-udskrivning', 'https://en.wikipedia.org/wiki/3D_printing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Akrobatik', 'https://en.wikipedia.org/wiki/Acrobatics', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Skuespil', 'https://en.wikipedia.org/wiki/Acting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Amat??rradio', 'https://en.wikipedia.org/wiki/Amateur_radio', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Animation', 'https://en.wikipedia.org/wiki/Animation', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Aquascaping', 'https://en.wikipedia.org/wiki/Aquascaping', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Astrologi', 'https://en.wikipedia.org/wiki/Astrology', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bagning', 'https://en.wikipedia.org/wiki/Baking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Baton snurrer', 'https://en.wikipedia.org/wiki/Baton_twirling', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Blogging', 'https://en.wikipedia.org/wiki/Blogging', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Br??tspil', 'https://en.wikipedia.org/wiki/Board_game', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bogdiskussionsklub', 'https://en.wikipedia.org/wiki/Book_discussion_club', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Gendannelse af b??ger', 'https://en.wikipedia.org/wiki/Book_restoration', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bowling', 'https://en.wikipedia.org/wiki/Bowling', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Brasiliansk jiu-jitsu', 'https://en.wikipedia.org/wiki/Brazilian_jiu-jitsu', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Br??dfremstilling', 'https://en.wikipedia.org/wiki/Breadmaking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bygning', 'https://en.wikipedia.org/wiki/Building', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bullet Journal', 'https://en.wikipedia.org/wiki/Bullet_Journal', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Cabaret', 'https://en.wikipedia.org/wiki/Cabaret', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kalligrafi', 'https://en.wikipedia.org/wiki/Calligraphy', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Lysfremstilling', 'https://en.wikipedia.org/wiki/Candle_making', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Slikfremstilling', 'https://en.wikipedia.org/wiki/Candy_making', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bil', 'https://en.wikipedia.org/wiki/Car', 'Generel', 'Indend??rs/Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kortspil', 'https://en.wikipedia.org/wiki/Card_games', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Cardistry', 'https://en.wikipedia.org/wiki/Cardistry', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Ostemagning', 'https://en.wikipedia.org/wiki/Cheesemaking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Reng??ring', 'https://en.wikipedia.org/wiki/Cleaning', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('T??j', 'https://en.wikipedia.org/wiki/Clothing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hjemmelavet kaffe', 'https://en.wikipedia.org/wiki/Home_roasting_coffee', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Indsamling', 'https://en.wikipedia.org/wiki/Collecting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Malebog', 'https://en.wikipedia.org/wiki/Coloring_book', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Computer programmering', 'https://en.wikipedia.org/wiki/Computer_programming', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Konfekture', 'https://en.wikipedia.org/wiki/Confectionery', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Madlavning', 'https://en.wikipedia.org/wiki/Cooking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Cosplaying', 'https://en.wikipedia.org/wiki/Cosplaying', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kuponering', 'https://en.wikipedia.org/wiki/Couponing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('H??ndv??rk', 'https://en.wikipedia.org/wiki/Craft', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kreativ skrivning', 'https://en.wikipedia.org/wiki/Creative_writing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('H??kling', 'https://en.wikipedia.org/wiki/Crocheting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Korssting', 'https://en.wikipedia.org/wiki/Cross-stitch', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Krydsogtv??rs', 'https://en.wikipedia.org/wiki/Crossword_puzzles', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kryptografi', 'https://en.wikipedia.org/wiki/Cryptography', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Cue sport', 'https://en.wikipedia.org/wiki/Cue_sports', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Dans', 'https://en.wikipedia.org/wiki/Dance', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Digital kunst', 'https://en.wikipedia.org/wiki/Digital_art', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Distro-hopping', 'https://en.wikipedia.org/wiki/Distro-hopping', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Disc-jockey', 'https://en.wikipedia.org/wiki/Disc-jockey', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('G??r det selv', 'https://en.wikipedia.org/wiki/Do_it_yourself', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Drama', 'https://en.wikipedia.org/wiki/Drama', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tegning', 'https://en.wikipedia.org/wiki/Drawing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Blandet drik', 'https://en.wikipedia.org/wiki/Mixed_drink', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Drikker', 'https://en.wikipedia.org/wiki/Drinking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Elektroniske spil', 'https://en.wikipedia.org/wiki/Electronic_games', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Elektronik', 'https://en.wikipedia.org/wiki/Electronics', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Broderi', 'https://en.wikipedia.org/wiki/Embroidery', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Eksperimenterer', 'https://en.wikipedia.org/wiki/Experimenting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fantasy sport', 'https://en.wikipedia.org/wiki/Fantasy_sport', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Mode', 'https://en.wikipedia.org/wiki/Fashion', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Mode design', 'https://en.wikipedia.org/wiki/Fashion_design', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fiskearbejde', 'https://en.wikipedia.org/wiki/Fishkeeping', 'Generel', ' Observation');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Filmfremstilling', 'https://en.wikipedia.org/wiki/Filmmaking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Blomsterbinding', 'https://en.wikipedia.org/wiki/Flower_arranging', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fluebinding', 'https://en.wikipedia.org/wiki/Fly_tying', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Andet sprog erhvervelse', 'https://en.wikipedia.org/wiki/Second-language_acquisition', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('M??bel', 'https://en.wikipedia.org/wiki/Furniture', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Spil', 'https://en.wikipedia.org/wiki/Games', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bordspil', 'https://en.wikipedia.org/wiki/Tabletop_game', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rollespil', 'https://en.wikipedia.org/wiki/Role-playing_game', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sl??gtsforskning', 'https://en.wikipedia.org/wiki/Genealogy', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Honningkagehus', 'https://en.wikipedia.org/wiki/Gingerbread_house', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Glasbl??sning', 'https://en.wikipedia.org/wiki/Glassblowing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Grafisk design', 'https://en.wikipedia.org/wiki/Graphic_design', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Gunsmithing', 'https://en.wikipedia.org/wiki/Gunsmithing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Gymnastik', 'https://en.wikipedia.org/wiki/Gymnastics', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hacker', 'https://en.wikipedia.org/wiki/Hacker', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Herpetokultur', 'https://en.wikipedia.org/wiki/Herpetoculture', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hjemmeforbedring', 'https://en.wikipedia.org/wiki/Home_improvement', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hjemmebrygning', 'https://en.wikipedia.org/wiki/Homebrewing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Pleje af husplanter', 'https://en.wikipedia.org/wiki/Houseplant_care', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hula b??jning', 'https://en.wikipedia.org/wiki/Hula_hooping', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Humor', 'https://en.wikipedia.org/wiki/Humor', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hydroponics', 'https://en.wikipedia.org/wiki/Hydroponics', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sk??jtel??b', 'https://en.wikipedia.org/wiki/Ice_skating', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Smykkefremstilling', 'https://en.wikipedia.org/wiki/Jewelry_making', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Puslespil', 'https://en.wikipedia.org/wiki/Jigsaw_puzzles', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Dagbog', 'https://en.wikipedia.org/wiki/Diary', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Jonglere', 'https://en.wikipedia.org/wiki/Juggling', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Karaoke', 'https://en.wikipedia.org/wiki/Karaoke', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Karate', 'https://en.wikipedia.org/wiki/Karate', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kendama', 'https://en.wikipedia.org/wiki/Kendama', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Knivfremstilling', 'https://en.wikipedia.org/wiki/Knife_making', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Strikning', 'https://en.wikipedia.org/wiki/Knitting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Knude binder', 'https://en.wikipedia.org/wiki/Knot_tying', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kombucha', 'https://en.wikipedia.org/wiki/Kombucha', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Blonder', 'https://en.wikipedia.org/wiki/Lace_making', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Lapidary', 'https://en.wikipedia.org/wiki/Lapidary', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('L??der h??ndv??rk', 'https://en.wikipedia.org/wiki/Leather_crafting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Lego', 'https://en.wikipedia.org/wiki/Lego', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('musik', 'https://en.wikipedia.org/wiki/Music', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Podcasts', 'https://en.wikipedia.org/wiki/Podcasts', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('L??seplukning', 'https://en.wikipedia.org/wiki/Lock_picking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bearbejdning', 'https://en.wikipedia.org/wiki/Machining', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Macrame', 'https://en.wikipedia.org/wiki/Macrame', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Magi (illusion)', 'https://en.wikipedia.org/wiki/Magic_(illusion)', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Makeup', 'https://en.wikipedia.org/wiki/Makeup', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Labyrint', 'https://en.wikipedia.org/wiki/Maze', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Metalbearbejdning', 'https://en.wikipedia.org/wiki/Metalworking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Modelbygning', 'https://en.wikipedia.org/wiki/Model_building', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Model engineering', 'https://en.wikipedia.org/wiki/Model_engineering', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Negle kunst', 'https://en.wikipedia.org/wiki/Nail_art', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('N??lepunkt', 'https://en.wikipedia.org/wiki/Needlepoint', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Origami', 'https://en.wikipedia.org/wiki/Origami', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Maleri', 'https://en.wikipedia.org/wiki/Painting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('H??ndflade', 'https://en.wikipedia.org/wiki/Palmistry', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Adoption af k??ledyr', 'https://en.wikipedia.org/wiki/Pet_adoption', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Filateli', 'https://en.wikipedia.org/wiki/Philately', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fotografering', 'https://en.wikipedia.org/wiki/Photography', 'Generel', ' Observation');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Pilates', 'https://en.wikipedia.org/wiki/Pilates', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Poi (performance)', 'https://en.wikipedia.org/wiki/Poi_(performance_art)', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Pole Dancing (siden findes ikke)',
        'https://en.wikipedia.org/w/index.php?title=Pole_Dancing&action=edit&redlink=1', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Keramik', 'https://en.wikipedia.org/wiki/Pottery', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kraftl??ftning', 'https://en.wikipedia.org/wiki/Powerlifting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Praktiske vittigheder', 'https://en.wikipedia.org/wiki/Practical_jokes', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Presset blomsterh??ndv??rk', 'https://en.wikipedia.org/wiki/Pressed_flower_craft', 'Generel', ' Samler hobbyer');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('G??de', 'https://en.wikipedia.org/wiki/Puzzle', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Quilling', 'https://en.wikipedia.org/wiki/Quilling', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Quiltning', 'https://en.wikipedia.org/wiki/Quilting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Quizzer', 'https://en.wikipedia.org/wiki/Quizzes', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Radiostyret model', 'https://en.wikipedia.org/wiki/Radio-controlled_model', 'Generel', ' Samler hobbyer');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Modellering af jernbanetransport', 'https://en.wikipedia.org/wiki/Rail_transport_modeling', 'Generel',
        ' Samler hobbyer');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rapping', 'https://en.wikipedia.org/wiki/Rapping', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('L??sning', 'https://en.wikipedia.org/wiki/Reading', 'Generel', ' Observation');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Efterbehandling', 'https://en.wikipedia.org/wiki/Refinishing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Reiki', 'https://en.wikipedia.org/wiki/Reiki', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Robotkamp', 'https://en.wikipedia.org/wiki/Robot_combat', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rubiks terning', 'https://en.wikipedia.org/wiki/Rubik%27s_Cube', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Scrapbooking', 'https://en.wikipedia.org/wiki/Scrapbooking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('SCUBA Dykning', 'https://en.wikipedia.org/wiki/SCUBA_Diving', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Modellering', 'https://en.wikipedia.org/wiki/Sculpting', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Syning', 'https://en.wikipedia.org/wiki/Sewing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Skomageri', 'https://en.wikipedia.org/wiki/Shoemaking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Synger', 'https://en.wikipedia.org/wiki/Singing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Skitse (tegning)', 'https://en.wikipedia.org/wiki/Sketch_(drawing)', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sjippetov', 'https://en.wikipedia.org/wiki/Skipping_rope', 'Generel', 'Indend??rs/Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Slot bil', 'https://en.wikipedia.org/wiki/Slot_car', 'Generel', ' Samler hobbyer');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('S??befremstilling', 'https://en.wikipedia.org/wiki/Soapmaking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sociale medier', 'https://en.wikipedia.org/wiki/Social_media', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Regneark', 'https://en.wikipedia.org/wiki/Spreadsheets', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Stand-up', 'https://en.wikipedia.org/wiki/Stand-up_comedy', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Frim??rkesamling', 'https://en.wikipedia.org/wiki/Stamp_collecting', 'Generel', ' Samler hobbyer');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bordtennis', 'https://en.wikipedia.org/wiki/Table_tennis', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tarot', 'https://en.wikipedia.org/wiki/Tarot', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Taksidermi', 'https://en.wikipedia.org/wiki/Taxidermy', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Velg??renhedsbutik', 'https://en.wikipedia.org/wiki/Charity_shop', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Videoredigering', 'https://en.wikipedia.org/wiki/Video_editing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Udvikling af videospil', 'https://en.wikipedia.org/wiki/Video_game_development', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Videospil', 'https://en.wikipedia.org/wiki/Video_gaming', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Videografi', 'https://en.wikipedia.org/wiki/Videography', 'Generel', 'Indend??rs/Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Virtual reality', 'https://en.wikipedia.org/wiki/Virtual_reality', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Film', 'https://en.wikipedia.org/wiki/Movies', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tv-program', 'https://en.wikipedia.org/wiki/Television_program', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Voksning', 'https://en.wikipedia.org/wiki/Waxing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('V??vning', 'https://en.wikipedia.org/wiki/Weaving', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Webtoon', 'https://en.wikipedia.org/wiki/Webtoon', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('V??gt tr??ning', 'https://en.wikipedia.org/wiki/Weight_training', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Svejsning', 'https://en.wikipedia.org/wiki/Welding', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hviskende', 'https://en.wikipedia.org/wiki/Whittling', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Vinfremstilling', 'https://en.wikipedia.org/wiki/Winemaking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tr??sk??ring', 'https://en.wikipedia.org/wiki/Wood_carving', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tr??bearbejdning', 'https://en.wikipedia.org/wiki/Woodworking', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Ords??gninger', 'https://en.wikipedia.org/wiki/Word_searches', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Verdensbygning', 'https://en.wikipedia.org/wiki/Worldbuilding', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Skrivning', 'https://en.wikipedia.org/wiki/Writing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Yo-yoing', 'https://en.wikipedia.org/wiki/Yo-yoing', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Yoga', 'https://en.wikipedia.org/wiki/Yoga', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Zumba', 'https://en.wikipedia.org/wiki/Zumba', 'Generel', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Luftsport', 'https://en.wikipedia.org/wiki/Air_sports', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Airsoft', 'https://en.wikipedia.org/wiki/Airsoft', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Amat??rgeologi', 'https://en.wikipedia.org/wiki/Amateur_geology', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Forlystelsespark', 'https://en.wikipedia.org/wiki/Amusement_park', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bueskydning', 'https://en.wikipedia.org/wiki/Archery', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Astronomi', 'https://en.wikipedia.org/wiki/Astronomy', 'Generel', ' Educational hobbies');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Backpacking (vildmark)', 'https://en.wikipedia.org/wiki/Backpacking_(wilderness)', 'Generel', ' Observation');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Badminton', 'https://en.wikipedia.org/wiki/Badminton', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Base jumping', 'https://en.wikipedia.org/wiki/BASE_jumping', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Baseball', 'https://en.wikipedia.org/wiki/Baseball', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Basketball', 'https://en.wikipedia.org/wiki/Basketball', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Biavl', 'https://en.wikipedia.org/wiki/Beekeeping', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fuglekiggeri', 'https://en.wikipedia.org/wiki/Birdwatching', 'Generel', ' Observation');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Smedarbejde', 'https://en.wikipedia.org/wiki/Blacksmithing', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('BMX', 'https://en.wikipedia.org/wiki/BMX', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Br??tsport', 'https://en.wikipedia.org/wiki/Board_sports', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bodybuilding', 'https://en.wikipedia.org/wiki/Bodybuilding', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bonsai', 'https://en.wikipedia.org/wiki/Bonsai', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sommerfugletur', 'https://en.wikipedia.org/wiki/Butterfly_watching', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bus', 'https://en.wikipedia.org/wiki/Bus', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Camping', 'https://en.wikipedia.org/wiki/Camping', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kanosejlads', 'https://en.wikipedia.org/wiki/Canoeing', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Canyoning', 'https://en.wikipedia.org/wiki/Canyoning', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Huleforskning', 'https://en.wikipedia.org/wiki/Caving', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kompostering', 'https://en.wikipedia.org/wiki/Composting', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Cykling', 'https://en.wikipedia.org/wiki/Cycling', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Dowsing', 'https://en.wikipedia.org/wiki/Dowsing', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('K??rsel', 'https://en.wikipedia.org/wiki/Driving', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Landbrug', 'https://en.wikipedia.org/wiki/Farming', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fiskeri', 'https://en.wikipedia.org/wiki/Fishing', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Flag fodbold', 'https://en.wikipedia.org/wiki/Flag_football', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Blomst', 'https://en.wikipedia.org/wiki/Flower', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Luftfart', 'https://en.wikipedia.org/wiki/Aviation', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Flyvende skive', 'https://en.wikipedia.org/wiki/Flying_disc', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Foder', 'https://en.wikipedia.org/wiki/Foraging', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fossicking', 'https://en.wikipedia.org/wiki/Fossicking', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Freestyle fodbold', 'https://en.wikipedia.org/wiki/Freestyle_football', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Havearbejde', 'https://en.wikipedia.org/wiki/Gardening', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Geocaching', 'https://en.wikipedia.org/wiki/Geocaching', 'Generel', ' Observation');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sp??gelsesjagt', 'https://en.wikipedia.org/wiki/Ghost_hunting', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Guldprospektering', 'https://en.wikipedia.org/wiki/Gold_prospecting', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Graffiti', 'https://en.wikipedia.org/wiki/Graffiti', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('H??ndbold', 'https://en.wikipedia.org/wiki/Handball', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Naturl??gemidler', 'https://en.wikipedia.org/wiki/Herbalism', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Herping', 'https://en.wikipedia.org/wiki/Herping', 'Generel', ' Observation');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('H??jeffektiv raket', 'https://en.wikipedia.org/wiki/High-power_rocketry', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Vandreture', 'https://en.wikipedia.org/wiki/Hiking', 'Generel', ' Observation');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hobby hest', 'https://en.wikipedia.org/wiki/Hobby_horse', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hobby tunneling', 'https://en.wikipedia.org/wiki/Hobby_tunneling', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hooping', 'https://en.wikipedia.org/wiki/Hooping', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Ridning', 'https://en.wikipedia.org/wiki/Horseback_riding', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Jagt', 'https://en.wikipedia.org/wiki/Hunting', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('In-line skating', 'https://en.wikipedia.org/wiki/Inline_skating', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('L??be', 'https://en.wikipedia.org/wiki/Jogging', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Ro kajak', 'https://en.wikipedia.org/wiki/Kayaking', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Glente', 'https://en.wikipedia.org/wiki/Kite', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kitesurfing', 'https://en.wikipedia.org/wiki/Kitesurfing', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Lacrosse', 'https://en.wikipedia.org/wiki/Lacrosse', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('LARPing', 'https://en.wikipedia.org/wiki/LARPing', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Letterboxing (hobby)', 'https://en.wikipedia.org/wiki/Letterboxing_(hobby)', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Longboarding', 'https://en.wikipedia.org/wiki/Longboarding', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kampsport', 'https://en.wikipedia.org/wiki/Martial_arts', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Metaldetektor', 'https://en.wikipedia.org/wiki/Metal_detector', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Meteorologi', 'https://en.wikipedia.org/wiki/Meteorology', 'Generel', ' Observation');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Motorsport', 'https://en.wikipedia.org/wiki/Motor_sports', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Mountainbiking', 'https://en.wikipedia.org/wiki/Mountain_biking', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bjergbestigning', 'https://en.wikipedia.org/wiki/Mountaineering', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Museum', 'https://en.wikipedia.org/wiki/Museum', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Svampejagt', 'https://en.wikipedia.org/wiki/Mushroom_hunting', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Mykologi', 'https://en.wikipedia.org/wiki/Mycology', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Netball', 'https://en.wikipedia.org/wiki/Netball', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Nordisk sk??jtel??b', 'https://en.wikipedia.org/wiki/Nordic_skating', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Orientering', 'https://en.wikipedia.org/wiki/Orienteering', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Paintball', 'https://en.wikipedia.org/wiki/Paintball', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Parkour', 'https://en.wikipedia.org/wiki/Parkour', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Podcast', 'https://en.wikipedia.org/wiki/Podcast', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Polo', 'https://en.wikipedia.org/wiki/Polo', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Offentlig transport', 'https://en.wikipedia.org/wiki/Public_transport', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rafting', 'https://en.wikipedia.org/wiki/Rafting', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Jernbane', 'https://en.wikipedia.org/wiki/Railway', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rappellering', 'https://en.wikipedia.org/wiki/Rappelling', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Road Cykling', 'https://en.wikipedia.org/wiki/Road_Cycling', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rullesk??jtel??b', 'https://en.wikipedia.org/wiki/Roller_skating', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rugby fodbold', 'https://en.wikipedia.org/wiki/Rugby_football', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('L??b', 'https://en.wikipedia.org/wiki/Running', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sejler', 'https://en.wikipedia.org/wiki/Sailing', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sand kunst og leg', 'https://en.wikipedia.org/wiki/Sand_art_and_play', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Spejder', 'https://en.wikipedia.org/wiki/Scouting', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Dykning', 'https://en.wikipedia.org/wiki/Scuba_diving', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sculling', 'https://en.wikipedia.org/wiki/Sculling', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Roning (sport)', 'https://en.wikipedia.org/wiki/Rowing_(sport)', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Optagelse', 'https://en.wikipedia.org/wiki/Shooting', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Handle ind', 'https://en.wikipedia.org/wiki/Shopping', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Shuffleboard', 'https://en.wikipedia.org/wiki/Shuffleboard', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Skateboarding', 'https://en.wikipedia.org/wiki/Skateboarding', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('St?? p?? ski', 'https://en.wikipedia.org/wiki/Skiing', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Skimboarding', 'https://en.wikipedia.org/wiki/Skimboarding', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Faldsk??rmsudspring', 'https://en.wikipedia.org/wiki/Skydiving', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Slacklining', 'https://en.wikipedia.org/wiki/Slacklining', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Snowboarding', 'https://en.wikipedia.org/wiki/Snowboarding', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Snescooterk??rsel', 'https://en.wikipedia.org/wiki/Snowmobiling', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Snesko', 'https://en.wikipedia.org/wiki/Snowshoeing', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fodbold', 'https://en.wikipedia.org/wiki/Soccer', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sten springer over', 'https://en.wikipedia.org/wiki/Stone_skipping', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Solbadning', 'https://en.wikipedia.org/wiki/Sun_bathing', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Surfing', 'https://en.wikipedia.org/wiki/Surfing', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Overlevelse', 'https://en.wikipedia.org/wiki/Survivalism', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Menneskelig sv??mning', 'https://en.wikipedia.org/wiki/Human_swimming', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Taekwondo', 'https://en.wikipedia.org/wiki/Taekwondo', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tai Chi', 'https://en.wikipedia.org/wiki/Tai_chi', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tennis', 'https://en.wikipedia.org/wiki/Tennis', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Topiary', 'https://en.wikipedia.org/wiki/Topiary', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Turisme', 'https://en.wikipedia.org/wiki/Tourism', 'Generel', ' Konkurrence');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Gennem vandring', 'https://en.wikipedia.org/wiki/Thru-hiking', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Messe', 'https://en.wikipedia.org/wiki/Trade_fair', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rejse', 'https://en.wikipedia.org/wiki/Travel', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Byudforskning', 'https://en.wikipedia.org/wiki/Urban_exploration', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Ferie', 'https://en.wikipedia.org/wiki/Vacation', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Vegetabilsk landbrug', 'https://en.wikipedia.org/wiki/Vegetable_farming', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Restaurering af k??ret??jet', 'https://en.wikipedia.org/wiki/Vehicle_restoration', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('G??', 'https://en.wikipedia.org/wiki/Walking', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Vandsport', 'https://en.wikipedia.org/wiki/Water_sports', 'Generel', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Biologi', 'https://en.wikipedia.org/wiki/Biology', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kemi', 'https://en.wikipedia.org/wiki/Chemistry', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Elektrokemi', 'https://en.wikipedia.org/wiki/Electrochemistry', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Geografi', 'https://en.wikipedia.org/wiki/Geography', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Historie', 'https://en.wikipedia.org/wiki/History', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Matematik', 'https://en.wikipedia.org/wiki/Mathematics', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Psykologi', 'https://en.wikipedia.org/wiki/Psychology', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fysik', 'https://en.wikipedia.org/wiki/Physics', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Jernbanetransport', 'https://en.wikipedia.org/wiki/Rail_transport', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Videnskab og teknologi studier', 'https://en.wikipedia.org/wiki/Science_and_technology_studies',
        'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sociale Studier', 'https://en.wikipedia.org/wiki/Social_studies', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sportsvidenskab', 'https://en.wikipedia.org/wiki/Sports_science', 'Educational hobbies', '---');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Action figur', 'https://en.wikipedia.org/wiki/Action_figure', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Antikviteter', 'https://en.wikipedia.org/wiki/Antiquing', 'Samler hobbyer', 'Indend??rs/Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Ant-holder', 'https://en.wikipedia.org/wiki/Ant-keeping', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kunstindsamling', 'https://en.wikipedia.org/wiki/Art_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bogindsamling', 'https://en.wikipedia.org/wiki/Book_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Knapopsamling', 'https://en.wikipedia.org/wiki/Button_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bytte kort', 'https://en.wikipedia.org/wiki/Trading_cards', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('M??ntindsamling', 'https://en.wikipedia.org/wiki/Coin_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tegneserieindsamling', 'https://en.wikipedia.org/wiki/Comic_book_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Deltiologi', 'https://en.wikipedia.org/wiki/Deltiology', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Die-cast leget??j', 'https://en.wikipedia.org/wiki/Die-cast_toy', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Digital hamstring', 'https://en.wikipedia.org/wiki/Digital_hoarding', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Dukker', 'https://en.wikipedia.org/wiki/Dolls', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Elementindsamling', 'https://en.wikipedia.org/wiki/Element_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Flygtig', 'https://en.wikipedia.org/wiki/Ephemera', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Telefonkort', 'https://en.wikipedia.org/wiki/Telephone_card', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Knivopsamling', 'https://en.wikipedia.org/wiki/Knife_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Lotologi', 'https://en.wikipedia.org/wiki/Lotology', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Film memorabilia', 'https://en.wikipedia.org/wiki/Film_memorabilia', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fingeraftryk', 'https://en.wikipedia.org/wiki/Fingerprint', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Parfume', 'https://en.wikipedia.org/wiki/Perfume', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Phillumeny', 'https://en.wikipedia.org/wiki/Phillumeny', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Pladesamling', 'https://en.wikipedia.org/wiki/Record_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rock tumbling', 'https://en.wikipedia.org/wiki/Rock_tumbling', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Patch indsamling', 'https://en.wikipedia.org/wiki/Patch_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sko', 'https://en.wikipedia.org/wiki/Shoes', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sportsmemorabilia', 'https://en.wikipedia.org/wiki/Sports_memorabilia', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('T??jdyr', 'https://en.wikipedia.org/wiki/Stuffed_toy', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Te pose', 'https://en.wikipedia.org/wiki/Tea_bag', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Billet (adgang)', 'https://en.wikipedia.org/wiki/Ticket_(admission)', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Leget??j', 'https://en.wikipedia.org/wiki/Toys', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Transitkort', 'https://en.wikipedia.org/wiki/Transit_map', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Samling af videospil', 'https://en.wikipedia.org/wiki/Video_game_collecting', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Vintage biler', 'https://en.wikipedia.org/wiki/Vintage_cars', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Vintage t??j', 'https://en.wikipedia.org/wiki/Vintage_clothing', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Vinylplader', 'https://en.wikipedia.org/wiki/Vinyl_Records', 'Samler hobbyer', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Auto audiophilia', 'https://en.wikipedia.org/wiki/Auto_audiophilia', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fossil jagt', 'https://en.wikipedia.org/wiki/Fossil_hunting', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Insektindsamling', 'https://en.wikipedia.org/wiki/Insect_collecting', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Magnetfiskeri', 'https://en.wikipedia.org/wiki/Magnet_fishing', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Metaldetektering', 'https://en.wikipedia.org/wiki/Metal_detecting', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Mineralindsamling', 'https://en.wikipedia.org/wiki/Mineral_collecting', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Stenbalancering', 'https://en.wikipedia.org/wiki/Rock_balancing', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Havglas', 'https://en.wikipedia.org/wiki/Sea_glass', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Muslingeskal', 'https://en.wikipedia.org/wiki/Seashell', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Stenopsamling', 'https://en.wikipedia.org/wiki/Stone_collecting', 'Samler hobbyer', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Dyrepleje', 'https://en.wikipedia.org/wiki/Animal_fancy', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('??ksekast', 'https://en.wikipedia.org/wiki/Axe_throwing', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Backgammon', 'https://en.wikipedia.org/wiki/Backgammon', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sk??nhedskonkurrence', 'https://en.wikipedia.org/wiki/Beauty_pageant', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Boksning', 'https://en.wikipedia.org/wiki/Boxing', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kontraktsbro', 'https://en.wikipedia.org/wiki/Contract_Bridge', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kladder', 'https://en.wikipedia.org/wiki/Draughts', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Cheerleading', 'https://en.wikipedia.org/wiki/Cheerleading', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Skak', 'https://en.wikipedia.org/wiki/Chess', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Farvebeskyttelse (flag spinding)', 'https://en.wikipedia.org/wiki/Color_guard_(flag_spinning)', 'Konkurrence',
        'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Cribbage', 'https://en.wikipedia.org/wiki/Cribbage', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Curling', 'https://en.wikipedia.org/wiki/Curling', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Konkurrencedygtig dans', 'https://en.wikipedia.org/wiki/Competitive_dance', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Dart', 'https://en.wikipedia.org/wiki/Darts', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Debat', 'https://en.wikipedia.org/wiki/Debate', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Dominoer', 'https://en.wikipedia.org/wiki/Dominoes', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Konkurrencedygtig spisning', 'https://en.wikipedia.org/wiki/Competitive_eating', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Esports', 'https://en.wikipedia.org/wiki/Esports', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hegn', 'https://en.wikipedia.org/wiki/Fencing', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('G?? (spil)', 'https://en.wikipedia.org/wiki/Go_(game)', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Ishockey', 'https://en.wikipedia.org/wiki/Ice_hockey', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Judo', 'https://en.wikipedia.org/wiki/Judo', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Jujitsu', 'https://en.wikipedia.org/wiki/Jujitsu', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kabaddi', 'https://en.wikipedia.org/wiki/Kabaddi', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Ordspil', 'https://en.wikipedia.org/wiki/Word_games', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Laserm??rke', 'https://en.wikipedia.org/wiki/Laser_tag', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Mahjong', 'https://en.wikipedia.org/wiki/Mahjong', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kugler', 'https://en.wikipedia.org/wiki/Marbles', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Model FN', 'https://en.wikipedia.org/wiki/Model_United_Nations', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Poker', 'https://en.wikipedia.org/wiki/Poker', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Pool (cue sports)', 'https://en.wikipedia.org/wiki/Pool_(cue_sports)', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Shogi', 'https://en.wikipedia.org/wiki/Shogi', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Slot bilspil', 'https://en.wikipedia.org/wiki/Slot_car_racing', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hurtigkubning', 'https://en.wikipedia.org/wiki/Speedcubing', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sport stabling', 'https://en.wikipedia.org/wiki/Sport_stacking', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bordfodbold', 'https://en.wikipedia.org/wiki/Table_football', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Volleyball', 'https://en.wikipedia.org/wiki/Volleyball', 'Konkurrence', 'Indend??rs/Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Brydning', 'https://en.wikipedia.org/wiki/Wrestling', 'Konkurrence', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Association fodbold', 'https://en.wikipedia.org/wiki/Association_football', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Australsk spiller fodbold', 'https://en.wikipedia.org/wiki/Australian_rules_football', 'Konkurrence',
        'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bilsport', 'https://en.wikipedia.org/wiki/Auto_racing', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Beach Volleyball', 'https://en.wikipedia.org/wiki/Beach_volleyball', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Breakdancing', 'https://en.wikipedia.org/wiki/Breakdancing', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Klatring', 'https://en.wikipedia.org/wiki/Climbing', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Cricket', 'https://en.wikipedia.org/wiki/Cricket', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Croquet', 'https://en.wikipedia.org/wiki/Croquet', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Disc golf', 'https://en.wikipedia.org/wiki/Disc_golf', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hundesport', 'https://en.wikipedia.org/wiki/Dog_sport', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Udstillings??velse', 'https://en.wikipedia.org/wiki/Exhibition_drill', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Field hockey', 'https://en.wikipedia.org/wiki/Field_hockey', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kunstsk??jtel??b', 'https://en.wikipedia.org/wiki/Figure_skating', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fodtaske', 'https://en.wikipedia.org/wiki/Footbag', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Frisbee', 'https://en.wikipedia.org/wiki/Frisbee', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Golf', 'https://en.wikipedia.org/wiki/Golf', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hestesko', 'https://en.wikipedia.org/wiki/Horseshoes', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Isb??d', 'https://en.wikipedia.org/wiki/Iceboat', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Jukskei', 'https://en.wikipedia.org/wiki/Jukskei', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kart racing', 'https://en.wikipedia.org/wiki/Kart_racing', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Knivkastning', 'https://en.wikipedia.org/wiki/Knife_throwing', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Langdistancel??b', 'https://en.wikipedia.org/wiki/Long-distance_running', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Marcherende band', 'https://en.wikipedia.org/wiki/Marching_band', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Modelfly', 'https://en.wikipedia.org/wiki/Model_aircraft', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Pickleball', 'https://en.wikipedia.org/wiki/Pickleball', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Quidditch (sport)', 'https://en.wikipedia.org/wiki/Quidditch_(sport)', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Race g??tur', 'https://en.wikipedia.org/wiki/Race_walking', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Racquetball', 'https://en.wikipedia.org/wiki/Racquetball', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Radiostyret bil', 'https://en.wikipedia.org/wiki/Radio-controlled_car', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Roller derby', 'https://en.wikipedia.org/wiki/Roller_derby', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Rugby liga', 'https://en.wikipedia.org/wiki/Rugby_league', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Roning', 'https://en.wikipedia.org/wiki/Rowing', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Skydesport', 'https://en.wikipedia.org/wiki/Shooting_sport', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Sl??dehundev??ddel??b', 'https://en.wikipedia.org/wiki/Sled_dog_racing', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Softball', 'https://en.wikipedia.org/wiki/Softball', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hurtigl??b p?? sk??jter', 'https://en.wikipedia.org/wiki/Speed_skating', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Squash (sport)', 'https://en.wikipedia.org/wiki/Squash_(sport)', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tennispolo', 'https://en.wikipedia.org/wiki/Tennis_polo', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Fastg??r bil', 'https://en.wikipedia.org/wiki/Tether_car', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Tour sk??jtel??b', 'https://en.wikipedia.org/wiki/Tour_skating', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Trapshooting', 'https://en.wikipedia.org/wiki/Trapshooting', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Triatlon', 'https://en.wikipedia.org/wiki/Triathlon', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Ultimate (sport)', 'https://en.wikipedia.org/wiki/Ultimate_(sport)', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Vandpolo', 'https://en.wikipedia.org/wiki/Water_polo', 'Konkurrence', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('L??ring', 'https://en.wikipedia.org/wiki/Learning', 'Observation', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Meditation', 'https://en.wikipedia.org/wiki/Meditation', 'Observation', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Mikroskopi', 'https://en.wikipedia.org/wiki/Microscopy', 'Observation', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Forskning', 'https://en.wikipedia.org/wiki/Research', 'Observation', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Kortb??lgelytning', 'https://en.wikipedia.org/wiki/Shortwave_listening', 'Observation', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Audiofil', 'https://en.wikipedia.org/wiki/Audiophile', 'Observation', 'Indend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Flyspotting', 'https://en.wikipedia.org/wiki/Aircraft_spotting', 'Observation', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Amat??r astronomi', 'https://en.wikipedia.org/wiki/Amateur_astronomy', 'Observation', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Bus spotting', 'https://en.wikipedia.org/wiki/Bus_spotting', 'Observation', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Gongoozler', 'https://en.wikipedia.org/wiki/Gongoozler', 'Observation', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Satellitoverv??gning', 'https://en.wikipedia.org/wiki/Satellite_watching', 'Observation', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Trainspotting (hobby)', 'https://en.wikipedia.org/wiki/Trainspotting_(hobby)', 'Observation', 'Udend??rs');
INSERT INTO HOBBY (name, wikiLink, category, type)
VALUES ('Hvalsafari', 'https://en.wikipedia.org/wiki/Whale_watching', 'Observation', 'Udend??rs');

INSERT INTO CITYINFO
VALUES ('0555', 'Scanning');
INSERT INTO CITYINFO
VALUES ('0800', 'H??je Taastrup');
INSERT INTO CITYINFO
VALUES ('0877', 'K??benhavn C');
INSERT INTO CITYINFO
VALUES ('0892', 'Sj??lland USF P');
INSERT INTO CITYINFO
VALUES ('0893', 'Sj??lland USF B');
INSERT INTO CITYINFO
VALUES ('0894', 'Udbetaling');
INSERT INTO CITYINFO
VALUES ('0897', 'eBrevspr??kken');
INSERT INTO CITYINFO
VALUES ('0899', 'Kommuneservice');
INSERT INTO CITYINFO
VALUES ('0900', 'K??benhavn C');
INSERT INTO CITYINFO
VALUES ('0910', 'K??benhavn C');
INSERT INTO CITYINFO
VALUES ('0917', 'K??benhavns Pakkecenter');
INSERT INTO CITYINFO
VALUES ('0918', 'K??benhavns Pakke BRC');
INSERT INTO CITYINFO
VALUES ('0919', 'Returprint BRC');
INSERT INTO CITYINFO
VALUES ('0929', 'K??benhavn C');
INSERT INTO CITYINFO
VALUES ('0960', 'Internationalt Postcenter');
INSERT INTO CITYINFO
VALUES ('0999', 'K??benhavn C');
INSERT INTO CITYINFO
VALUES ('1000', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1001', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1002', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1003', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1004', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1005', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1006', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1007', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1008', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1009', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1010', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1011', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1012', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1013', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1014', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1015', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1016', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1017', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1018', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1019', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1020', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1021', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1022', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1023', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1024', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1025', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1026', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1045', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1050', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1051', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1052', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1053', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1054', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1055', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1056', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1057', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1058', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1059', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1060', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1061', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1062', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1063', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1064', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1065', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1066', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1067', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1068', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1069', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1070', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1071', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1072', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1073', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1074', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1092', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1093', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1095', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1098', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1100', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1101', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1102', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1103', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1104', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1105', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1106', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1107', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1110', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1111', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1112', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1113', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1114', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1115', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1116', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1117', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1118', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1119', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1120', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1121', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1122', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1123', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1124', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1125', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1126', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1127', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1128', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1129', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1130', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1131', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1140', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1147', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1148', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1150', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1151', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1152', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1153', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1154', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1155', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1156', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1157', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1158', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1159', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1160', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1161', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1162', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1163', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1164', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1165', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1166', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1167', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1168', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1169', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1170', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1171', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1172', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1173', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1174', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1175', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1200', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1201', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1202', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1203', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1204', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1205', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1206', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1207', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1208', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1209', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1210', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1211', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1212', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1213', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1214', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1215', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1216', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1217', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1218', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1219', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1220', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1221', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1240', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1250', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1251', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1252', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1253', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1254', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1255', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1256', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1257', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1258', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1259', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1260', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1261', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1263', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1264', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1265', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1266', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1267', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1268', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1270', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1271', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1291', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1300', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1301', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1302', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1303', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1304', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1306', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1307', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1308', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1309', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1310', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1311', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1312', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1313', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1314', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1315', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1316', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1317', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1318', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1319', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1320', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1321', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1322', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1323', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1324', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1325', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1326', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1327', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1328', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1329', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1350', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1352', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1353', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1354', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1355', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1356', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1357', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1358', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1359', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1360', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1361', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1362', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1363', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1364', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1365', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1366', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1367', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1368', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1369', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1370', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1371', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1400', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1401', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1402', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1403', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1404', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1406', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1407', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1408', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1409', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1410', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1411', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1412', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1413', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1414', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1415', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1416', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1417', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1418', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1419', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1420', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1421', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1422', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1423', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1424', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1425', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1426', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1427', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1428', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1429', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1430', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1431', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1432', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1433', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1434', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1435', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1436', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1437', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1438', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1439', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1440', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1441', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1448', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1450', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1452', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1453', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1454', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1455', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1456', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1457', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1458', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1459', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1460', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1461', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1462', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1463', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1464', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1465', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1466', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1467', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1468', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1470', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1471', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1472', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1473', 'K??benhavn K');
INSERT INTO CITYINFO
VALUES ('1500', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1501', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1502', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1503', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1504', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1505', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1506', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1507', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1508', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1509', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1510', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1512', 'Returpost');
INSERT INTO CITYINFO
VALUES ('1513', 'Centraltastning');
INSERT INTO CITYINFO
VALUES ('1532', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1533', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1550', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1551', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1552', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1553', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1554', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1555', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1556', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1557', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1558', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1559', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1560', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1561', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1562', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1563', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1564', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1566', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1567', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1568', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1569', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1570', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1571', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1572', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1573', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1574', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1575', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1576', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1577', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1592', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1599', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1600', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1601', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1602', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1603', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1604', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1605', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1606', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1607', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1608', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1609', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1610', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1611', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1612', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1613', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1614', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1615', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1616', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1617', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1618', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1619', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1620', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1621', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1622', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1623', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1624', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1630', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1631', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1632', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1633', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1634', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1635', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1650', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1651', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1652', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1653', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1654', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1655', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1656', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1657', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1658', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1659', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1660', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1661', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1662', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1663', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1664', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1665', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1666', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1667', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1668', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1669', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1670', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1671', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1672', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1673', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1674', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1675', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1676', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1677', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1699', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1700', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1701', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1702', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1703', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1704', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1705', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1706', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1707', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1708', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1709', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1710', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1711', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1712', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1713', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1714', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1715', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1716', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1717', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1718', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1719', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1720', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1721', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1722', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1723', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1724', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1725', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1726', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1727', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1728', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1729', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1730', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1731', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1732', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1733', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1734', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1735', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1736', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1737', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1738', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1739', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1749', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1750', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1751', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1752', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1753', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1754', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1755', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1756', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1757', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1758', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1759', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1760', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1761', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1762', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1763', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1764', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1765', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1766', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1770', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1771', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1772', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1773', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1774', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1775', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1777', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1780', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1782', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1785', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1786', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1787', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1790', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1799', 'K??benhavn V');
INSERT INTO CITYINFO
VALUES ('1800', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1801', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1802', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1803', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1804', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1805', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1806', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1807', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1808', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1809', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1810', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1811', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1812', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1813', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1814', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1815', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1816', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1817', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1818', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1819', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1820', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1822', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1823', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1824', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1825', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1826', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1827', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1828', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1829', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1835', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1850', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1851', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1852', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1853', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1854', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1855', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1856', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1857', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1860', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1861', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1862', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1863', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1864', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1865', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1866', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1867', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1868', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1870', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1871', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1872', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1873', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1874', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1875', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1876', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1877', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1878', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1879', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1900', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1901', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1902', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1903', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1904', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1905', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1906', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1908', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1909', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1910', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1911', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1912', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1913', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1914', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1915', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1916', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1917', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1920', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1921', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1922', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1923', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1924', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1925', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1926', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1927', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1928', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1931', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1950', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1951', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1952', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1953', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1954', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1955', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1956', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1957', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1958', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1959', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1960', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1961', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1962', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1963', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1964', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1965', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1966', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1967', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1970', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1971', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1972', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1973', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('1974', 'Frederiksberg C');
INSERT INTO CITYINFO
VALUES ('2000', 'Frederiksberg');
INSERT INTO CITYINFO
VALUES ('2100', 'K??benhavn ??');
INSERT INTO CITYINFO
VALUES ('2150', 'Nordhavn');
INSERT INTO CITYINFO
VALUES ('2200', 'K??benhavn N');
INSERT INTO CITYINFO
VALUES ('2300', 'K??benhavn S');
INSERT INTO CITYINFO
VALUES ('2400', 'K??benhavn NV');
INSERT INTO CITYINFO
VALUES ('2450', 'K??benhavn SV');
INSERT INTO CITYINFO
VALUES ('2500', 'Valby');
INSERT INTO CITYINFO
VALUES ('2600', 'Glostrup');
INSERT INTO CITYINFO
VALUES ('2605', 'Br??ndby');
INSERT INTO CITYINFO
VALUES ('2610', 'R??dovre');
INSERT INTO CITYINFO
VALUES ('2620', 'Albertslund');
INSERT INTO CITYINFO
VALUES ('2625', 'Vallensb??k');
INSERT INTO CITYINFO
VALUES ('2630', 'Taastrup');
INSERT INTO CITYINFO
VALUES ('2635', 'Ish??j');
INSERT INTO CITYINFO
VALUES ('2640', 'Hedehusene');
INSERT INTO CITYINFO
VALUES ('2650', 'Hvidovre');
INSERT INTO CITYINFO
VALUES ('2660', 'Br??ndby Strand');
INSERT INTO CITYINFO
VALUES ('2665', 'Vallensb??k Strand');
INSERT INTO CITYINFO
VALUES ('2670', 'Greve');
INSERT INTO CITYINFO
VALUES ('2680', 'Solr??d Strand');
INSERT INTO CITYINFO
VALUES ('2690', 'Karlslunde');
INSERT INTO CITYINFO
VALUES ('2700', 'Br??nsh??j');
INSERT INTO CITYINFO
VALUES ('2720', 'Vanl??se');
INSERT INTO CITYINFO
VALUES ('2730', 'Herlev');
INSERT INTO CITYINFO
VALUES ('2740', 'Skovlunde');
INSERT INTO CITYINFO
VALUES ('2750', 'Ballerup');
INSERT INTO CITYINFO
VALUES ('2760', 'M??l??v');
INSERT INTO CITYINFO
VALUES ('2765', 'Sm??rum');
INSERT INTO CITYINFO
VALUES ('2770', 'Kastrup');
INSERT INTO CITYINFO
VALUES ('2791', 'Drag??r');
INSERT INTO CITYINFO
VALUES ('2800', 'Kongens Lyngby');
INSERT INTO CITYINFO
VALUES ('2820', 'Gentofte');
INSERT INTO CITYINFO
VALUES ('2830', 'Virum');
INSERT INTO CITYINFO
VALUES ('2840', 'Holte');
INSERT INTO CITYINFO
VALUES ('2850', 'N??rum');
INSERT INTO CITYINFO
VALUES ('2860', 'S??borg');
INSERT INTO CITYINFO
VALUES ('2870', 'Dysseg??rd');
INSERT INTO CITYINFO
VALUES ('2880', 'Bagsv??rd');
INSERT INTO CITYINFO
VALUES ('2900', 'Hellerup');
INSERT INTO CITYINFO
VALUES ('2920', 'Charlottenlund');
INSERT INTO CITYINFO
VALUES ('2930', 'Klampenborg');
INSERT INTO CITYINFO
VALUES ('2942', 'Skodsborg');
INSERT INTO CITYINFO
VALUES ('2950', 'Vedb??k');
INSERT INTO CITYINFO
VALUES ('2960', 'Rungsted Kyst');
INSERT INTO CITYINFO
VALUES ('2970', 'H??rsholm');
INSERT INTO CITYINFO
VALUES ('2980', 'Kokkedal');
INSERT INTO CITYINFO
VALUES ('2990', 'Niv??');
INSERT INTO CITYINFO
VALUES ('3000', 'Helsing??r');
INSERT INTO CITYINFO
VALUES ('3050', 'Humleb??k');
INSERT INTO CITYINFO
VALUES ('3060', 'Esperg??rde');
INSERT INTO CITYINFO
VALUES ('3070', 'Snekkersten');
INSERT INTO CITYINFO
VALUES ('3080', 'Tik??b');
INSERT INTO CITYINFO
VALUES ('3100', 'Hornb??k');
INSERT INTO CITYINFO
VALUES ('3120', 'Dronningm??lle');
INSERT INTO CITYINFO
VALUES ('3140', '??lsg??rde');
INSERT INTO CITYINFO
VALUES ('3150', 'Helleb??k');
INSERT INTO CITYINFO
VALUES ('3200', 'Helsinge');
INSERT INTO CITYINFO
VALUES ('3210', 'Vejby');
INSERT INTO CITYINFO
VALUES ('3220', 'Tisvildeleje');
INSERT INTO CITYINFO
VALUES ('3230', 'Gr??sted');
INSERT INTO CITYINFO
VALUES ('3250', 'Gilleleje');
INSERT INTO CITYINFO
VALUES ('3300', 'Frederiksv??rk');
INSERT INTO CITYINFO
VALUES ('3310', '??lsted');
INSERT INTO CITYINFO
VALUES ('3320', 'Sk??vinge');
INSERT INTO CITYINFO
VALUES ('3330', 'G??rl??se');
INSERT INTO CITYINFO
VALUES ('3360', 'Liseleje');
INSERT INTO CITYINFO
VALUES ('3370', 'Melby');
INSERT INTO CITYINFO
VALUES ('3390', 'Hundested');
INSERT INTO CITYINFO
VALUES ('3400', 'Hiller??d');
INSERT INTO CITYINFO
VALUES ('3450', 'Aller??d');
INSERT INTO CITYINFO
VALUES ('3460', 'Birker??d');
INSERT INTO CITYINFO
VALUES ('3480', 'Fredensborg');
INSERT INTO CITYINFO
VALUES ('3490', 'Kvistg??rd');
INSERT INTO CITYINFO
VALUES ('3500', 'V??rl??se');
INSERT INTO CITYINFO
VALUES ('3520', 'Farum');
INSERT INTO CITYINFO
VALUES ('3540', 'Lynge');
INSERT INTO CITYINFO
VALUES ('3550', 'Slangerup');
INSERT INTO CITYINFO
VALUES ('3600', 'Frederikssund');
INSERT INTO CITYINFO
VALUES ('3630', 'J??gerspris');
INSERT INTO CITYINFO
VALUES ('3650', '??lstykke');
INSERT INTO CITYINFO
VALUES ('3660', 'Stenl??se');
INSERT INTO CITYINFO
VALUES ('3670', 'Veks?? Sj??lland');
INSERT INTO CITYINFO
VALUES ('3700', 'R??nne');
INSERT INTO CITYINFO
VALUES ('3720', 'Aakirkeby');
INSERT INTO CITYINFO
VALUES ('3730', 'Nex??');
INSERT INTO CITYINFO
VALUES ('3740', 'Svaneke');
INSERT INTO CITYINFO
VALUES ('3751', '??stermarie');
INSERT INTO CITYINFO
VALUES ('3760', 'Gudhjem');
INSERT INTO CITYINFO
VALUES ('3770', 'Allinge');
INSERT INTO CITYINFO
VALUES ('3782', 'Klemensker');
INSERT INTO CITYINFO
VALUES ('3790', 'Hasle');
INSERT INTO CITYINFO
VALUES ('4000', 'Roskilde');
INSERT INTO CITYINFO
VALUES ('4030', 'Tune');
INSERT INTO CITYINFO
VALUES ('4040', 'Jyllinge');
INSERT INTO CITYINFO
VALUES ('4050', 'Skibby');
INSERT INTO CITYINFO
VALUES ('4060', 'Kirke S??by');
INSERT INTO CITYINFO
VALUES ('4070', 'Kirke Hyllinge');
INSERT INTO CITYINFO
VALUES ('4100', 'Ringsted');
INSERT INTO CITYINFO
VALUES ('4129', 'Ringsted');
INSERT INTO CITYINFO
VALUES ('4130', 'Viby Sj??lland');
INSERT INTO CITYINFO
VALUES ('4140', 'Borup');
INSERT INTO CITYINFO
VALUES ('4160', 'Herlufmagle');
INSERT INTO CITYINFO
VALUES ('4171', 'Glums??');
INSERT INTO CITYINFO
VALUES ('4173', 'Fjenneslev');
INSERT INTO CITYINFO
VALUES ('4174', 'Jystrup Midtsj');
INSERT INTO CITYINFO
VALUES ('4180', 'Sor??');
INSERT INTO CITYINFO
VALUES ('4190', 'Munke Bjergby');
INSERT INTO CITYINFO
VALUES ('4200', 'Slagelse');
INSERT INTO CITYINFO
VALUES ('4220', 'Kors??r');
INSERT INTO CITYINFO
VALUES ('4230', 'Sk??lsk??r');
INSERT INTO CITYINFO
VALUES ('4241', 'Vemmelev');
INSERT INTO CITYINFO
VALUES ('4242', 'Boeslunde');
INSERT INTO CITYINFO
VALUES ('4243', 'Rude');
INSERT INTO CITYINFO
VALUES ('4250', 'Fuglebjerg');
INSERT INTO CITYINFO
VALUES ('4261', 'Dalmose');
INSERT INTO CITYINFO
VALUES ('4262', 'Sandved');
INSERT INTO CITYINFO
VALUES ('4270', 'H??ng');
INSERT INTO CITYINFO
VALUES ('4281', 'G??rlev');
INSERT INTO CITYINFO
VALUES ('4291', 'Ruds Vedby');
INSERT INTO CITYINFO
VALUES ('4293', 'Dianalund');
INSERT INTO CITYINFO
VALUES ('4295', 'Stenlille');
INSERT INTO CITYINFO
VALUES ('4296', 'Nyrup');
INSERT INTO CITYINFO
VALUES ('4300', 'Holb??k');
INSERT INTO CITYINFO
VALUES ('4320', 'Lejre');
INSERT INTO CITYINFO
VALUES ('4330', 'Hvals??');
INSERT INTO CITYINFO
VALUES ('4340', 'T??ll??se');
INSERT INTO CITYINFO
VALUES ('4350', 'Ugerl??se');
INSERT INTO CITYINFO
VALUES ('4360', 'Kirke Eskilstrup');
INSERT INTO CITYINFO
VALUES ('4370', 'Store Merl??se');
INSERT INTO CITYINFO
VALUES ('4390', 'Vipper??d');
INSERT INTO CITYINFO
VALUES ('4400', 'Kalundborg');
INSERT INTO CITYINFO
VALUES ('4420', 'Regstrup');
INSERT INTO CITYINFO
VALUES ('4440', 'M??rk??v');
INSERT INTO CITYINFO
VALUES ('4450', 'Jyderup');
INSERT INTO CITYINFO
VALUES ('4460', 'Snertinge');
INSERT INTO CITYINFO
VALUES ('4470', 'Sveb??lle');
INSERT INTO CITYINFO
VALUES ('4480', 'Store Fuglede');
INSERT INTO CITYINFO
VALUES ('4490', 'Jerslev Sj??lland');
INSERT INTO CITYINFO
VALUES ('4500', 'Nyk??bing Sj');
INSERT INTO CITYINFO
VALUES ('4520', 'Svinninge');
INSERT INTO CITYINFO
VALUES ('4532', 'Gislinge');
INSERT INTO CITYINFO
VALUES ('4534', 'H??rve');
INSERT INTO CITYINFO
VALUES ('4540', 'F??revejle');
INSERT INTO CITYINFO
VALUES ('4550', 'Asn??s');
INSERT INTO CITYINFO
VALUES ('4560', 'Vig');
INSERT INTO CITYINFO
VALUES ('4571', 'Grevinge');
INSERT INTO CITYINFO
VALUES ('4572', 'N??rre Asmindrup');
INSERT INTO CITYINFO
VALUES ('4573', 'H??jby');
INSERT INTO CITYINFO
VALUES ('4581', 'R??rvig');
INSERT INTO CITYINFO
VALUES ('4583', 'Sj??llands Odde');
INSERT INTO CITYINFO
VALUES ('4591', 'F??llenslev');
INSERT INTO CITYINFO
VALUES ('4592', 'Sejer??');
INSERT INTO CITYINFO
VALUES ('4593', 'Eskebjerg');
INSERT INTO CITYINFO
VALUES ('4600', 'K??ge');
INSERT INTO CITYINFO
VALUES ('4621', 'Gadstrup');
INSERT INTO CITYINFO
VALUES ('4622', 'Havdrup');
INSERT INTO CITYINFO
VALUES ('4623', 'Lille Skensved');
INSERT INTO CITYINFO
VALUES ('4632', 'Bj??verskov');
INSERT INTO CITYINFO
VALUES ('4640', 'Faxe');
INSERT INTO CITYINFO
VALUES ('4652', 'H??rlev');
INSERT INTO CITYINFO
VALUES ('4653', 'Karise');
INSERT INTO CITYINFO
VALUES ('4654', 'Faxe Ladeplads');
INSERT INTO CITYINFO
VALUES ('4660', 'Store Heddinge');
INSERT INTO CITYINFO
VALUES ('4671', 'Str??by');
INSERT INTO CITYINFO
VALUES ('4672', 'Klippinge');
INSERT INTO CITYINFO
VALUES ('4673', 'R??dvig Stevns');
INSERT INTO CITYINFO
VALUES ('4681', 'Herf??lge');
INSERT INTO CITYINFO
VALUES ('4682', 'Tureby');
INSERT INTO CITYINFO
VALUES ('4683', 'R??nnede');
INSERT INTO CITYINFO
VALUES ('4684', 'Holmegaard');
INSERT INTO CITYINFO
VALUES ('4690', 'Haslev');
INSERT INTO CITYINFO
VALUES ('4700', 'N??stved');
INSERT INTO CITYINFO
VALUES ('4720', 'Pr??st??');
INSERT INTO CITYINFO
VALUES ('4733', 'Tappern??je');
INSERT INTO CITYINFO
VALUES ('4735', 'Mern');
INSERT INTO CITYINFO
VALUES ('4736', 'Karreb??ksminde');
INSERT INTO CITYINFO
VALUES ('4750', 'Lundby');
INSERT INTO CITYINFO
VALUES ('4760', 'Vordingborg');
INSERT INTO CITYINFO
VALUES ('4771', 'Kalvehave');
INSERT INTO CITYINFO
VALUES ('4772', 'Langeb??k');
INSERT INTO CITYINFO
VALUES ('4773', 'Stensved');
INSERT INTO CITYINFO
VALUES ('4780', 'Stege');
INSERT INTO CITYINFO
VALUES ('4791', 'Borre');
INSERT INTO CITYINFO
VALUES ('4792', 'Askeby');
INSERT INTO CITYINFO
VALUES ('4793', 'Bog?? By');
INSERT INTO CITYINFO
VALUES ('4800', 'Nyk??bing F');
INSERT INTO CITYINFO
VALUES ('4840', 'N??rre Alslev');
INSERT INTO CITYINFO
VALUES ('4850', 'Stubbek??bing');
INSERT INTO CITYINFO
VALUES ('4862', 'Guldborg');
INSERT INTO CITYINFO
VALUES ('4863', 'Eskilstrup');
INSERT INTO CITYINFO
VALUES ('4871', 'Horbelev');
INSERT INTO CITYINFO
VALUES ('4872', 'Idestrup');
INSERT INTO CITYINFO
VALUES ('4873', 'V??ggerl??se');
INSERT INTO CITYINFO
VALUES ('4874', 'Gedser');
INSERT INTO CITYINFO
VALUES ('4880', 'Nysted');
INSERT INTO CITYINFO
VALUES ('4891', 'Toreby L');
INSERT INTO CITYINFO
VALUES ('4892', 'Kettinge');
INSERT INTO CITYINFO
VALUES ('4894', '??ster Ulslev');
INSERT INTO CITYINFO
VALUES ('4895', 'Errindlev');
INSERT INTO CITYINFO
VALUES ('4900', 'Nakskov');
INSERT INTO CITYINFO
VALUES ('4912', 'Harpelunde');
INSERT INTO CITYINFO
VALUES ('4913', 'Horslunde');
INSERT INTO CITYINFO
VALUES ('4920', 'S??llested');
INSERT INTO CITYINFO
VALUES ('4930', 'Maribo');
INSERT INTO CITYINFO
VALUES ('4941', 'Bandholm');
INSERT INTO CITYINFO
VALUES ('4943', 'Torrig L');
INSERT INTO CITYINFO
VALUES ('4944', 'Fej??');
INSERT INTO CITYINFO
VALUES ('4951', 'N??rreballe');
INSERT INTO CITYINFO
VALUES ('4952', 'Stokkemarke');
INSERT INTO CITYINFO
VALUES ('4953', 'Vesterborg');
INSERT INTO CITYINFO
VALUES ('4960', 'Holeby');
INSERT INTO CITYINFO
VALUES ('4970', 'R??dby');
INSERT INTO CITYINFO
VALUES ('4983', 'Dannemare');
INSERT INTO CITYINFO
VALUES ('4990', 'Saksk??bing');
INSERT INTO CITYINFO
VALUES ('4992', 'Midtsj??lland USF P');
INSERT INTO CITYINFO
VALUES ('5000', 'Odense C');
INSERT INTO CITYINFO
VALUES ('5029', 'Odense C');
INSERT INTO CITYINFO
VALUES ('5100', 'Odense C');
INSERT INTO CITYINFO
VALUES ('5200', 'Odense V');
INSERT INTO CITYINFO
VALUES ('5210', 'Odense NV');
INSERT INTO CITYINFO
VALUES ('5220', 'Odense S??');
INSERT INTO CITYINFO
VALUES ('5230', 'Odense M');
INSERT INTO CITYINFO
VALUES ('5240', 'Odense N??');
INSERT INTO CITYINFO
VALUES ('5250', 'Odense SV');
INSERT INTO CITYINFO
VALUES ('5260', 'Odense S');
INSERT INTO CITYINFO
VALUES ('5270', 'Odense N');
INSERT INTO CITYINFO
VALUES ('5290', 'Marslev');
INSERT INTO CITYINFO
VALUES ('5300', 'Kerteminde');
INSERT INTO CITYINFO
VALUES ('5320', 'Agedrup');
INSERT INTO CITYINFO
VALUES ('5330', 'Munkebo');
INSERT INTO CITYINFO
VALUES ('5350', 'Rynkeby');
INSERT INTO CITYINFO
VALUES ('5370', 'Mesinge');
INSERT INTO CITYINFO
VALUES ('5380', 'Dalby');
INSERT INTO CITYINFO
VALUES ('5390', 'Martofte');
INSERT INTO CITYINFO
VALUES ('5400', 'Bogense');
INSERT INTO CITYINFO
VALUES ('5450', 'Otterup');
INSERT INTO CITYINFO
VALUES ('5462', 'Morud');
INSERT INTO CITYINFO
VALUES ('5463', 'Harndrup');
INSERT INTO CITYINFO
VALUES ('5464', 'Brenderup Fyn');
INSERT INTO CITYINFO
VALUES ('5466', 'Asperup');
INSERT INTO CITYINFO
VALUES ('5471', 'S??nders??');
INSERT INTO CITYINFO
VALUES ('5474', 'Veflinge');
INSERT INTO CITYINFO
VALUES ('5485', 'Skamby');
INSERT INTO CITYINFO
VALUES ('5491', 'Blommenslyst');
INSERT INTO CITYINFO
VALUES ('5492', 'Vissenbjerg');
INSERT INTO CITYINFO
VALUES ('5500', 'Middelfart');
INSERT INTO CITYINFO
VALUES ('5540', 'Ullerslev');
INSERT INTO CITYINFO
VALUES ('5550', 'Langeskov');
INSERT INTO CITYINFO
VALUES ('5560', 'Aarup');
INSERT INTO CITYINFO
VALUES ('5580', 'N??rre Aaby');
INSERT INTO CITYINFO
VALUES ('5591', 'Gelsted');
INSERT INTO CITYINFO
VALUES ('5592', 'Ejby');
INSERT INTO CITYINFO
VALUES ('5600', 'Faaborg');
INSERT INTO CITYINFO
VALUES ('5610', 'Assens');
INSERT INTO CITYINFO
VALUES ('5620', 'Glamsbjerg');
INSERT INTO CITYINFO
VALUES ('5631', 'Ebberup');
INSERT INTO CITYINFO
VALUES ('5642', 'Millinge');
INSERT INTO CITYINFO
VALUES ('5672', 'Broby');
INSERT INTO CITYINFO
VALUES ('5683', 'Haarby');
INSERT INTO CITYINFO
VALUES ('5690', 'Tommerup');
INSERT INTO CITYINFO
VALUES ('5700', 'Svendborg');
INSERT INTO CITYINFO
VALUES ('5750', 'Ringe');
INSERT INTO CITYINFO
VALUES ('5762', 'Vester Skerninge');
INSERT INTO CITYINFO
VALUES ('5771', 'Stenstrup');
INSERT INTO CITYINFO
VALUES ('5772', 'Kv??rndrup');
INSERT INTO CITYINFO
VALUES ('5792', '??rslev');
INSERT INTO CITYINFO
VALUES ('5800', 'Nyborg');
INSERT INTO CITYINFO
VALUES ('5853', '??rb??k');
INSERT INTO CITYINFO
VALUES ('5854', 'Gislev');
INSERT INTO CITYINFO
VALUES ('5856', 'Ryslinge');
INSERT INTO CITYINFO
VALUES ('5863', 'Ferritslev Fyn');
INSERT INTO CITYINFO
VALUES ('5871', 'Fr??rup');
INSERT INTO CITYINFO
VALUES ('5874', 'Hesselager');
INSERT INTO CITYINFO
VALUES ('5881', 'Sk??rup Fyn');
INSERT INTO CITYINFO
VALUES ('5882', 'Vejstrup');
INSERT INTO CITYINFO
VALUES ('5883', 'Oure');
INSERT INTO CITYINFO
VALUES ('5884', 'Gudme');
INSERT INTO CITYINFO
VALUES ('5892', 'Gudbjerg Sydfyn');
INSERT INTO CITYINFO
VALUES ('5900', 'Rudk??bing');
INSERT INTO CITYINFO
VALUES ('5932', 'Humble');
INSERT INTO CITYINFO
VALUES ('5935', 'Bagenkop');
INSERT INTO CITYINFO
VALUES ('5953', 'Tranek??r');
INSERT INTO CITYINFO
VALUES ('5960', 'Marstal');
INSERT INTO CITYINFO
VALUES ('5970', '??r??sk??bing');
INSERT INTO CITYINFO
VALUES ('5985', 'S??by ??r??');
INSERT INTO CITYINFO
VALUES ('6000', 'Kolding');
INSERT INTO CITYINFO
VALUES ('6040', 'Egtved');
INSERT INTO CITYINFO
VALUES ('6051', 'Almind');
INSERT INTO CITYINFO
VALUES ('6052', 'Viuf');
INSERT INTO CITYINFO
VALUES ('6064', 'Jordrup');
INSERT INTO CITYINFO
VALUES ('6070', 'Christiansfeld');
INSERT INTO CITYINFO
VALUES ('6091', 'Bjert');
INSERT INTO CITYINFO
VALUES ('6092', 'S??nder Stenderup');
INSERT INTO CITYINFO
VALUES ('6093', 'Sj??lund');
INSERT INTO CITYINFO
VALUES ('6094', 'Hejls');
INSERT INTO CITYINFO
VALUES ('6100', 'Haderslev');
INSERT INTO CITYINFO
VALUES ('6200', 'Aabenraa');
INSERT INTO CITYINFO
VALUES ('6230', 'R??dekro');
INSERT INTO CITYINFO
VALUES ('6240', 'L??gumkloster');
INSERT INTO CITYINFO
VALUES ('6261', 'Bredebro');
INSERT INTO CITYINFO
VALUES ('6270', 'T??nder');
INSERT INTO CITYINFO
VALUES ('6280', 'H??jer');
INSERT INTO CITYINFO
VALUES ('6300', 'Gr??sten');
INSERT INTO CITYINFO
VALUES ('6310', 'Broager');
INSERT INTO CITYINFO
VALUES ('6320', 'Egernsund');
INSERT INTO CITYINFO
VALUES ('6330', 'Padborg');
INSERT INTO CITYINFO
VALUES ('6340', 'Krus??');
INSERT INTO CITYINFO
VALUES ('6360', 'Tinglev');
INSERT INTO CITYINFO
VALUES ('6372', 'Bylderup-Bov');
INSERT INTO CITYINFO
VALUES ('6392', 'Bolderslev');
INSERT INTO CITYINFO
VALUES ('6400', 'S??nderborg');
INSERT INTO CITYINFO
VALUES ('6430', 'Nordborg');
INSERT INTO CITYINFO
VALUES ('6440', 'Augustenborg');
INSERT INTO CITYINFO
VALUES ('6470', 'Sydals');
INSERT INTO CITYINFO
VALUES ('6500', 'Vojens');
INSERT INTO CITYINFO
VALUES ('6510', 'Gram');
INSERT INTO CITYINFO
VALUES ('6520', 'Toftlund');
INSERT INTO CITYINFO
VALUES ('6534', 'Agerskov');
INSERT INTO CITYINFO
VALUES ('6535', 'Branderup J');
INSERT INTO CITYINFO
VALUES ('6541', 'Bevtoft');
INSERT INTO CITYINFO
VALUES ('6560', 'Sommersted');
INSERT INTO CITYINFO
VALUES ('6580', 'Vamdrup');
INSERT INTO CITYINFO
VALUES ('6600', 'Vejen');
INSERT INTO CITYINFO
VALUES ('6621', 'Gesten');
INSERT INTO CITYINFO
VALUES ('6622', 'B??kke');
INSERT INTO CITYINFO
VALUES ('6623', 'Vorbasse');
INSERT INTO CITYINFO
VALUES ('6630', 'R??dding');
INSERT INTO CITYINFO
VALUES ('6640', 'Lunderskov');
INSERT INTO CITYINFO
VALUES ('6650', 'Br??rup');
INSERT INTO CITYINFO
VALUES ('6660', 'Lintrup');
INSERT INTO CITYINFO
VALUES ('6670', 'Holsted');
INSERT INTO CITYINFO
VALUES ('6682', 'Hovborg');
INSERT INTO CITYINFO
VALUES ('6683', 'F??vling');
INSERT INTO CITYINFO
VALUES ('6690', 'G??rding');
INSERT INTO CITYINFO
VALUES ('6700', 'Esbjerg');
INSERT INTO CITYINFO
VALUES ('6701', 'Esbjerg');
INSERT INTO CITYINFO
VALUES ('6705', 'Esbjerg ??');
INSERT INTO CITYINFO
VALUES ('6710', 'Esbjerg V');
INSERT INTO CITYINFO
VALUES ('6715', 'Esbjerg N');
INSERT INTO CITYINFO
VALUES ('6720', 'Fan??');
INSERT INTO CITYINFO
VALUES ('6731', 'Tj??reborg');
INSERT INTO CITYINFO
VALUES ('6740', 'Bramming');
INSERT INTO CITYINFO
VALUES ('6752', 'Glejbjerg');
INSERT INTO CITYINFO
VALUES ('6753', 'Agerb??k');
INSERT INTO CITYINFO
VALUES ('6760', 'Ribe');
INSERT INTO CITYINFO
VALUES ('6771', 'Gredstedbro');
INSERT INTO CITYINFO
VALUES ('6780', 'Sk??rb??k');
INSERT INTO CITYINFO
VALUES ('6792', 'R??m??');
INSERT INTO CITYINFO
VALUES ('6800', 'Varde');
INSERT INTO CITYINFO
VALUES ('6818', '??rre');
INSERT INTO CITYINFO
VALUES ('6823', 'Ansager');
INSERT INTO CITYINFO
VALUES ('6830', 'N??rre Nebel');
INSERT INTO CITYINFO
VALUES ('6840', 'Oksb??l');
INSERT INTO CITYINFO
VALUES ('6851', 'Janderup Vestj');
INSERT INTO CITYINFO
VALUES ('6852', 'Billum');
INSERT INTO CITYINFO
VALUES ('6853', 'Vejers Strand');
INSERT INTO CITYINFO
VALUES ('6854', 'Henne');
INSERT INTO CITYINFO
VALUES ('6855', 'Outrup');
INSERT INTO CITYINFO
VALUES ('6857', 'Bl??vand');
INSERT INTO CITYINFO
VALUES ('6862', 'Tistrup');
INSERT INTO CITYINFO
VALUES ('6870', '??lgod');
INSERT INTO CITYINFO
VALUES ('6880', 'Tarm');
INSERT INTO CITYINFO
VALUES ('6893', 'Hemmet');
INSERT INTO CITYINFO
VALUES ('6900', 'Skjern');
INSERT INTO CITYINFO
VALUES ('6920', 'Videb??k');
INSERT INTO CITYINFO
VALUES ('6933', 'Kib??k');
INSERT INTO CITYINFO
VALUES ('6940', 'Lem St');
INSERT INTO CITYINFO
VALUES ('6950', 'Ringk??bing');
INSERT INTO CITYINFO
VALUES ('6960', 'Hvide Sande');
INSERT INTO CITYINFO
VALUES ('6971', 'Spjald');
INSERT INTO CITYINFO
VALUES ('6973', '??rnh??j');
INSERT INTO CITYINFO
VALUES ('6980', 'Tim');
INSERT INTO CITYINFO
VALUES ('6990', 'Ulfborg');
INSERT INTO CITYINFO
VALUES ('7000', 'Fredericia');
INSERT INTO CITYINFO
VALUES ('7007', 'Fredericia');
INSERT INTO CITYINFO
VALUES ('7017', 'Taulov Pakkecenter');
INSERT INTO CITYINFO
VALUES ('7018', 'Pakker TLP');
INSERT INTO CITYINFO
VALUES ('7029', 'Fredericia');
INSERT INTO CITYINFO
VALUES ('7080', 'B??rkop');
INSERT INTO CITYINFO
VALUES ('7100', 'Vejle');
INSERT INTO CITYINFO
VALUES ('7120', 'Vejle ??st');
INSERT INTO CITYINFO
VALUES ('7130', 'Juelsminde');
INSERT INTO CITYINFO
VALUES ('7140', 'Stouby');
INSERT INTO CITYINFO
VALUES ('7150', 'Barrit');
INSERT INTO CITYINFO
VALUES ('7160', 'T??rring');
INSERT INTO CITYINFO
VALUES ('7171', 'Uldum');
INSERT INTO CITYINFO
VALUES ('7173', 'Vonge');
INSERT INTO CITYINFO
VALUES ('7182', 'Bredsten');
INSERT INTO CITYINFO
VALUES ('7183', 'Randb??l');
INSERT INTO CITYINFO
VALUES ('7184', 'Vandel');
INSERT INTO CITYINFO
VALUES ('7190', 'Billund');
INSERT INTO CITYINFO
VALUES ('7200', 'Grindsted');
INSERT INTO CITYINFO
VALUES ('7250', 'Hejnsvig');
INSERT INTO CITYINFO
VALUES ('7260', 'S??nder Omme');
INSERT INTO CITYINFO
VALUES ('7270', 'Stakroge');
INSERT INTO CITYINFO
VALUES ('7280', 'S??nder Felding');
INSERT INTO CITYINFO
VALUES ('7300', 'Jelling');
INSERT INTO CITYINFO
VALUES ('7321', 'Gadbjerg');
INSERT INTO CITYINFO
VALUES ('7323', 'Give');
INSERT INTO CITYINFO
VALUES ('7330', 'Brande');
INSERT INTO CITYINFO
VALUES ('7361', 'Ejstrupholm');
INSERT INTO CITYINFO
VALUES ('7362', 'Hampen');
INSERT INTO CITYINFO
VALUES ('7400', 'Herning');
INSERT INTO CITYINFO
VALUES ('7429', 'Herning');
INSERT INTO CITYINFO
VALUES ('7430', 'Ikast');
INSERT INTO CITYINFO
VALUES ('7441', 'Bording');
INSERT INTO CITYINFO
VALUES ('7442', 'Engesvang');
INSERT INTO CITYINFO
VALUES ('7451', 'Sunds');
INSERT INTO CITYINFO
VALUES ('7470', 'Karup J');
INSERT INTO CITYINFO
VALUES ('7480', 'Vildbjerg');
INSERT INTO CITYINFO
VALUES ('7490', 'Aulum');
INSERT INTO CITYINFO
VALUES ('7500', 'Holstebro');
INSERT INTO CITYINFO
VALUES ('7540', 'Haderup');
INSERT INTO CITYINFO
VALUES ('7550', 'S??rvad');
INSERT INTO CITYINFO
VALUES ('7560', 'Hjerm');
INSERT INTO CITYINFO
VALUES ('7570', 'Vemb');
INSERT INTO CITYINFO
VALUES ('7600', 'Struer');
INSERT INTO CITYINFO
VALUES ('7620', 'Lemvig');
INSERT INTO CITYINFO
VALUES ('7650', 'B??vlingbjerg');
INSERT INTO CITYINFO
VALUES ('7660', 'B??kmarksbro');
INSERT INTO CITYINFO
VALUES ('7673', 'Harbo??re');
INSERT INTO CITYINFO
VALUES ('7680', 'Thybor??n');
INSERT INTO CITYINFO
VALUES ('7700', 'Thisted');
INSERT INTO CITYINFO
VALUES ('7730', 'Hanstholm');
INSERT INTO CITYINFO
VALUES ('7741', 'Fr??strup');
INSERT INTO CITYINFO
VALUES ('7742', 'Vesl??s');
INSERT INTO CITYINFO
VALUES ('7752', 'Snedsted');
INSERT INTO CITYINFO
VALUES ('7755', 'Bedsted Thy');
INSERT INTO CITYINFO
VALUES ('7760', 'Hurup Thy');
INSERT INTO CITYINFO
VALUES ('7770', 'Vestervig');
INSERT INTO CITYINFO
VALUES ('7790', 'Thyholm');
INSERT INTO CITYINFO
VALUES ('7800', 'Skive');
INSERT INTO CITYINFO
VALUES ('7830', 'Vinderup');
INSERT INTO CITYINFO
VALUES ('7840', 'H??jslev');
INSERT INTO CITYINFO
VALUES ('7850', 'Stoholm Jyll');
INSERT INTO CITYINFO
VALUES ('7860', 'Sp??ttrup');
INSERT INTO CITYINFO
VALUES ('7870', 'Roslev');
INSERT INTO CITYINFO
VALUES ('7884', 'Fur');
INSERT INTO CITYINFO
VALUES ('7900', 'Nyk??bing M');
INSERT INTO CITYINFO
VALUES ('7950', 'Erslev');
INSERT INTO CITYINFO
VALUES ('7960', 'Karby');
INSERT INTO CITYINFO
VALUES ('7970', 'Redsted M');
INSERT INTO CITYINFO
VALUES ('7980', 'Vils');
INSERT INTO CITYINFO
VALUES ('7990', '??ster Assels');
INSERT INTO CITYINFO
VALUES ('7992', 'Sydjylland/Fyn USF P');
INSERT INTO CITYINFO
VALUES ('7993', 'Sydjylland/Fyn USF B');
INSERT INTO CITYINFO
VALUES ('7996', 'Fakturaservice');
INSERT INTO CITYINFO
VALUES ('7997', 'Fakturascanning');
INSERT INTO CITYINFO
VALUES ('7998', 'Statsservice');
INSERT INTO CITYINFO
VALUES ('7999', 'Kommunepost');
INSERT INTO CITYINFO
VALUES ('8000', 'Aarhus C');
INSERT INTO CITYINFO
VALUES ('8100', 'Aarhus C');
INSERT INTO CITYINFO
VALUES ('8200', 'Aarhus N');
INSERT INTO CITYINFO
VALUES ('8210', 'Aarhus V');
INSERT INTO CITYINFO
VALUES ('8220', 'Brabrand');
INSERT INTO CITYINFO
VALUES ('8229', 'Risskov ??');
INSERT INTO CITYINFO
VALUES ('8230', '??byh??j');
INSERT INTO CITYINFO
VALUES ('8240', 'Risskov');
INSERT INTO CITYINFO
VALUES ('8245', 'Risskov ??');
INSERT INTO CITYINFO
VALUES ('8250', 'Eg??');
INSERT INTO CITYINFO
VALUES ('8260', 'Viby J');
INSERT INTO CITYINFO
VALUES ('8270', 'H??jbjerg');
INSERT INTO CITYINFO
VALUES ('8300', 'Odder');
INSERT INTO CITYINFO
VALUES ('8305', 'Sams??');
INSERT INTO CITYINFO
VALUES ('8310', 'Tranbjerg J');
INSERT INTO CITYINFO
VALUES ('8320', 'M??rslet');
INSERT INTO CITYINFO
VALUES ('8330', 'Beder');
INSERT INTO CITYINFO
VALUES ('8340', 'Malling');
INSERT INTO CITYINFO
VALUES ('8350', 'Hundslund');
INSERT INTO CITYINFO
VALUES ('8355', 'Solbjerg');
INSERT INTO CITYINFO
VALUES ('8361', 'Hasselager');
INSERT INTO CITYINFO
VALUES ('8362', 'H??rning');
INSERT INTO CITYINFO
VALUES ('8370', 'Hadsten');
INSERT INTO CITYINFO
VALUES ('8380', 'Trige');
INSERT INTO CITYINFO
VALUES ('8381', 'Tilst');
INSERT INTO CITYINFO
VALUES ('8382', 'Hinnerup');
INSERT INTO CITYINFO
VALUES ('8400', 'Ebeltoft');
INSERT INTO CITYINFO
VALUES ('8410', 'R??nde');
INSERT INTO CITYINFO
VALUES ('8420', 'Knebel');
INSERT INTO CITYINFO
VALUES ('8444', 'Balle');
INSERT INTO CITYINFO
VALUES ('8450', 'Hammel');
INSERT INTO CITYINFO
VALUES ('8462', 'Harlev J');
INSERT INTO CITYINFO
VALUES ('8464', 'Galten');
INSERT INTO CITYINFO
VALUES ('8471', 'Sabro');
INSERT INTO CITYINFO
VALUES ('8472', 'Sporup');
INSERT INTO CITYINFO
VALUES ('8500', 'Grenaa');
INSERT INTO CITYINFO
VALUES ('8520', 'Lystrup');
INSERT INTO CITYINFO
VALUES ('8530', 'Hjortsh??j');
INSERT INTO CITYINFO
VALUES ('8541', 'Sk??dstrup');
INSERT INTO CITYINFO
VALUES ('8543', 'Hornslet');
INSERT INTO CITYINFO
VALUES ('8544', 'M??rke');
INSERT INTO CITYINFO
VALUES ('8550', 'Ryomg??rd');
INSERT INTO CITYINFO
VALUES ('8560', 'Kolind');
INSERT INTO CITYINFO
VALUES ('8570', 'Trustrup');
INSERT INTO CITYINFO
VALUES ('8581', 'Nimtofte');
INSERT INTO CITYINFO
VALUES ('8585', 'Glesborg');
INSERT INTO CITYINFO
VALUES ('8586', '??rum Djurs');
INSERT INTO CITYINFO
VALUES ('8592', 'Anholt');
INSERT INTO CITYINFO
VALUES ('8600', 'Silkeborg');
INSERT INTO CITYINFO
VALUES ('8620', 'Kjellerup');
INSERT INTO CITYINFO
VALUES ('8632', 'Lemming');
INSERT INTO CITYINFO
VALUES ('8641', 'Sorring');
INSERT INTO CITYINFO
VALUES ('8643', 'Ans By');
INSERT INTO CITYINFO
VALUES ('8653', 'Them');
INSERT INTO CITYINFO
VALUES ('8654', 'Bryrup');
INSERT INTO CITYINFO
VALUES ('8660', 'Skanderborg');
INSERT INTO CITYINFO
VALUES ('8670', 'L??sby');
INSERT INTO CITYINFO
VALUES ('8680', 'Ry');
INSERT INTO CITYINFO
VALUES ('8700', 'Horsens');
INSERT INTO CITYINFO
VALUES ('8721', 'Daug??rd');
INSERT INTO CITYINFO
VALUES ('8722', 'Hedensted');
INSERT INTO CITYINFO
VALUES ('8723', 'L??sning');
INSERT INTO CITYINFO
VALUES ('8732', 'Hovedg??rd');
INSERT INTO CITYINFO
VALUES ('8740', 'Br??dstrup');
INSERT INTO CITYINFO
VALUES ('8751', 'Gedved');
INSERT INTO CITYINFO
VALUES ('8752', '??stbirk');
INSERT INTO CITYINFO
VALUES ('8762', 'Flemming');
INSERT INTO CITYINFO
VALUES ('8763', 'Rask M??lle');
INSERT INTO CITYINFO
VALUES ('8765', 'Klovborg');
INSERT INTO CITYINFO
VALUES ('8766', 'N??rre Snede');
INSERT INTO CITYINFO
VALUES ('8781', 'Stenderup');
INSERT INTO CITYINFO
VALUES ('8783', 'Hornsyld');
INSERT INTO CITYINFO
VALUES ('8800', 'Viborg');
INSERT INTO CITYINFO
VALUES ('8830', 'Tjele');
INSERT INTO CITYINFO
VALUES ('8831', 'L??gstrup');
INSERT INTO CITYINFO
VALUES ('8832', 'Skals');
INSERT INTO CITYINFO
VALUES ('8840', 'R??dk??rsbro');
INSERT INTO CITYINFO
VALUES ('8850', 'Bjerringbro');
INSERT INTO CITYINFO
VALUES ('8860', 'Ulstrup');
INSERT INTO CITYINFO
VALUES ('8870', 'Lang??');
INSERT INTO CITYINFO
VALUES ('8881', 'Thors??');
INSERT INTO CITYINFO
VALUES ('8882', 'F??rvang');
INSERT INTO CITYINFO
VALUES ('8883', 'Gjern');
INSERT INTO CITYINFO
VALUES ('8900', 'Randers C');
INSERT INTO CITYINFO
VALUES ('8920', 'Randers NV');
INSERT INTO CITYINFO
VALUES ('8930', 'Randers N??');
INSERT INTO CITYINFO
VALUES ('8940', 'Randers SV');
INSERT INTO CITYINFO
VALUES ('8950', '??rsted');
INSERT INTO CITYINFO
VALUES ('8960', 'Randers S??');
INSERT INTO CITYINFO
VALUES ('8961', 'Alling??bro');
INSERT INTO CITYINFO
VALUES ('8963', 'Auning');
INSERT INTO CITYINFO
VALUES ('8970', 'Havndal');
INSERT INTO CITYINFO
VALUES ('8981', 'Spentrup');
INSERT INTO CITYINFO
VALUES ('8983', 'Gjerlev J');
INSERT INTO CITYINFO
VALUES ('8990', 'F??rup');
INSERT INTO CITYINFO
VALUES ('9000', 'Aalborg');
INSERT INTO CITYINFO
VALUES ('9029', 'Aalborg');
INSERT INTO CITYINFO
VALUES ('9100', 'Aalborg');
INSERT INTO CITYINFO
VALUES ('9200', 'Aalborg SV');
INSERT INTO CITYINFO
VALUES ('9210', 'Aalborg S??');
INSERT INTO CITYINFO
VALUES ('9220', 'Aalborg ??st');
INSERT INTO CITYINFO
VALUES ('9230', 'Svenstrup J');
INSERT INTO CITYINFO
VALUES ('9240', 'Nibe');
INSERT INTO CITYINFO
VALUES ('9260', 'Gistrup');
INSERT INTO CITYINFO
VALUES ('9270', 'Klarup');
INSERT INTO CITYINFO
VALUES ('9280', 'Storvorde');
INSERT INTO CITYINFO
VALUES ('9293', 'Kongerslev');
INSERT INTO CITYINFO
VALUES ('9300', 'S??by');
INSERT INTO CITYINFO
VALUES ('9310', 'Vodskov');
INSERT INTO CITYINFO
VALUES ('9320', 'Hjallerup');
INSERT INTO CITYINFO
VALUES ('9330', 'Dronninglund');
INSERT INTO CITYINFO
VALUES ('9340', 'Asaa');
INSERT INTO CITYINFO
VALUES ('9352', 'Dybvad');
INSERT INTO CITYINFO
VALUES ('9362', 'Gandrup');
INSERT INTO CITYINFO
VALUES ('9370', 'Hals');
INSERT INTO CITYINFO
VALUES ('9380', 'Vestbjerg');
INSERT INTO CITYINFO
VALUES ('9381', 'Sulsted');
INSERT INTO CITYINFO
VALUES ('9382', 'Tylstrup');
INSERT INTO CITYINFO
VALUES ('9400', 'N??rresundby');
INSERT INTO CITYINFO
VALUES ('9430', 'Vadum');
INSERT INTO CITYINFO
VALUES ('9440', 'Aabybro');
INSERT INTO CITYINFO
VALUES ('9460', 'Brovst');
INSERT INTO CITYINFO
VALUES ('9480', 'L??kken');
INSERT INTO CITYINFO
VALUES ('9490', 'Pandrup');
INSERT INTO CITYINFO
VALUES ('9492', 'Blokhus');
INSERT INTO CITYINFO
VALUES ('9493', 'Saltum');
INSERT INTO CITYINFO
VALUES ('9500', 'Hobro');
INSERT INTO CITYINFO
VALUES ('9510', 'Arden');
INSERT INTO CITYINFO
VALUES ('9520', 'Sk??rping');
INSERT INTO CITYINFO
VALUES ('9530', 'St??vring');
INSERT INTO CITYINFO
VALUES ('9541', 'Suldrup');
INSERT INTO CITYINFO
VALUES ('9550', 'Mariager');
INSERT INTO CITYINFO
VALUES ('9560', 'Hadsund');
INSERT INTO CITYINFO
VALUES ('9574', 'B??lum');
INSERT INTO CITYINFO
VALUES ('9575', 'Terndrup');
INSERT INTO CITYINFO
VALUES ('9600', 'Aars');
INSERT INTO CITYINFO
VALUES ('9610', 'N??rager');
INSERT INTO CITYINFO
VALUES ('9620', 'Aalestrup');
INSERT INTO CITYINFO
VALUES ('9631', 'Gedsted');
INSERT INTO CITYINFO
VALUES ('9632', 'M??ldrup');
INSERT INTO CITYINFO
VALUES ('9640', 'Fars??');
INSERT INTO CITYINFO
VALUES ('9670', 'L??gst??r');
INSERT INTO CITYINFO
VALUES ('9681', 'Ranum');
INSERT INTO CITYINFO
VALUES ('9690', 'Fjerritslev');
INSERT INTO CITYINFO
VALUES ('9700', 'Br??nderslev');
INSERT INTO CITYINFO
VALUES ('9740', 'Jerslev J');
INSERT INTO CITYINFO
VALUES ('9750', '??stervr??');
INSERT INTO CITYINFO
VALUES ('9760', 'Vr??');
INSERT INTO CITYINFO
VALUES ('9800', 'Hj??rring');
INSERT INTO CITYINFO
VALUES ('9830', 'T??rs');
INSERT INTO CITYINFO
VALUES ('9850', 'Hirtshals');
INSERT INTO CITYINFO
VALUES ('9870', 'Sindal');
INSERT INTO CITYINFO
VALUES ('9881', 'Bindslev');
INSERT INTO CITYINFO
VALUES ('9900', 'Frederikshavn');
INSERT INTO CITYINFO
VALUES ('9940', 'L??s??');
INSERT INTO CITYINFO
VALUES ('9970', 'Strandby');
INSERT INTO CITYINFO
VALUES ('9981', 'Jerup');
INSERT INTO CITYINFO
VALUES ('9982', '??lb??k');
INSERT INTO CITYINFO
VALUES ('9990', 'Skagen');
INSERT INTO CITYINFO
VALUES ('9992', 'Jylland USF P');
INSERT INTO CITYINFO
VALUES ('9993', 'Jylland USF B');
INSERT INTO CITYINFO
VALUES ('9996', 'Fakturaservice');
INSERT INTO CITYINFO
VALUES ('9997', 'Fakturascanning');
INSERT INTO CITYINFO
VALUES ('9998', 'Borgerservice');
INSERT INTO CITYINFO
VALUES ('2412', 'Santa Claus/Julemanden');
INSERT INTO CITYINFO
VALUES ('3900', 'Nuuk');
INSERT INTO CITYINFO
VALUES ('3905', 'Nuussuaq');
INSERT INTO CITYINFO
VALUES ('3910', 'Kangerlussuaq');
INSERT INTO CITYINFO
VALUES ('3911', 'Sisimiut');
INSERT INTO CITYINFO
VALUES ('3912', 'Maniitsoq');
INSERT INTO CITYINFO
VALUES ('3913', 'Tasiilaq');
INSERT INTO CITYINFO
VALUES ('3915', 'Kulusuk');
INSERT INTO CITYINFO
VALUES ('3919', 'Alluitsup Paa');
INSERT INTO CITYINFO
VALUES ('3920', 'Qaqortoq');
INSERT INTO CITYINFO
VALUES ('3921', 'Narsaq');
INSERT INTO CITYINFO
VALUES ('3922', 'Nanortalik');
INSERT INTO CITYINFO
VALUES ('3923', 'Narsarsuaq');
INSERT INTO CITYINFO
VALUES ('3924', 'Ikerasassuaq');
INSERT INTO CITYINFO
VALUES ('3930', 'Kangilinnguit');
INSERT INTO CITYINFO
VALUES ('3932', 'Arsuk');
INSERT INTO CITYINFO
VALUES ('3940', 'Paamiut');
INSERT INTO CITYINFO
VALUES ('3950', 'Aasiaat');
INSERT INTO CITYINFO
VALUES ('3951', 'Qasigiannguit');
INSERT INTO CITYINFO
VALUES ('3952', 'Ilulissat');
INSERT INTO CITYINFO
VALUES ('3953', 'Qeqertarsuaq');
INSERT INTO CITYINFO
VALUES ('3955', 'Kangaatsiaq');
INSERT INTO CITYINFO
VALUES ('3961', 'Uummannaq');
INSERT INTO CITYINFO
VALUES ('3962', 'Upernavik');
INSERT INTO CITYINFO
VALUES ('3964', 'Qaarsut');
INSERT INTO CITYINFO
VALUES ('3970', 'Pituffik');
INSERT INTO CITYINFO
VALUES ('3971', 'Qaanaaq');
INSERT INTO CITYINFO
VALUES ('3972', 'Station Nord');
INSERT INTO CITYINFO
VALUES ('3980', 'Ittoqqortoormiit');
INSERT INTO CITYINFO
VALUES ('3982', 'Mestersvig');
INSERT INTO CITYINFO
VALUES ('3984', 'Danmarkshavn');
INSERT INTO CITYINFO
VALUES ('3985', 'Constable Pynt');
INSERT INTO CITYINFO
VALUES ('3992', 'Sl??depatrulje Sirius');
INSERT INTO CITYINFO
VALUES ('100', 'T??rshavn');
INSERT INTO CITYINFO
VALUES ('110', 'T??rshavn ');
INSERT INTO CITYINFO
VALUES ('160', 'Argir');
INSERT INTO CITYINFO
VALUES ('165', 'Argir ');
INSERT INTO CITYINFO
VALUES ('175', 'Kirkjub??ur');
INSERT INTO CITYINFO
VALUES ('176', 'Velbastadur');
INSERT INTO CITYINFO
VALUES ('177', 'Sydradalur, Streymoy');
INSERT INTO CITYINFO
VALUES ('178', 'Nordradalur');
INSERT INTO CITYINFO
VALUES ('180', 'Kaldbak');
INSERT INTO CITYINFO
VALUES ('185', 'Kaldbaksbotnur');
INSERT INTO CITYINFO
VALUES ('186', 'Sund');
INSERT INTO CITYINFO
VALUES ('187', 'Hvitanes');
INSERT INTO CITYINFO
VALUES ('188', 'Hoyv??k');
INSERT INTO CITYINFO
VALUES ('210', 'Sandur');
INSERT INTO CITYINFO
VALUES ('215', 'Sandur');
INSERT INTO CITYINFO
VALUES ('220', 'Sk??lav??k');
INSERT INTO CITYINFO
VALUES ('230', 'H??sav??k');
INSERT INTO CITYINFO
VALUES ('235', 'Dalur');
INSERT INTO CITYINFO
VALUES ('236', 'Skarvanes');
INSERT INTO CITYINFO
VALUES ('240', 'Skopun');
INSERT INTO CITYINFO
VALUES ('260', 'Sk??voy');
INSERT INTO CITYINFO
VALUES ('270', 'N??lsoy');
INSERT INTO CITYINFO
VALUES ('280', 'Hestur');
INSERT INTO CITYINFO
VALUES ('285', 'Koltur');
INSERT INTO CITYINFO
VALUES ('286', 'St??ra Dimun');
INSERT INTO CITYINFO
VALUES ('330', 'Stykkid');
INSERT INTO CITYINFO
VALUES ('335', 'Leynar');
INSERT INTO CITYINFO
VALUES ('336', 'Sk??llingur');
INSERT INTO CITYINFO
VALUES ('340', 'Kv??v??k');
INSERT INTO CITYINFO
VALUES ('350', 'Vestmanna');
INSERT INTO CITYINFO
VALUES ('355', 'Vestmanna');
INSERT INTO CITYINFO
VALUES ('358', 'V??lur');
INSERT INTO CITYINFO
VALUES ('360', 'Sandav??gur');
INSERT INTO CITYINFO
VALUES ('370', 'Midv??gur');
INSERT INTO CITYINFO
VALUES ('375', 'Midv??gur');
INSERT INTO CITYINFO
VALUES ('380', 'S??rv??gur');
INSERT INTO CITYINFO
VALUES ('385', 'Vatnsoyrar');
INSERT INTO CITYINFO
VALUES ('386', 'B??ur');
INSERT INTO CITYINFO
VALUES ('387', 'G??sadalur');
INSERT INTO CITYINFO
VALUES ('388', 'Mykines');
INSERT INTO CITYINFO
VALUES ('400', 'Oyrarbakki');
INSERT INTO CITYINFO
VALUES ('405', 'Oyrarbakki');
INSERT INTO CITYINFO
VALUES ('410', 'Kollafj??rdur');
INSERT INTO CITYINFO
VALUES ('415', 'Oyrareingir');
INSERT INTO CITYINFO
VALUES ('416', 'Signab??ur');
INSERT INTO CITYINFO
VALUES ('420', 'H??sv??k');
INSERT INTO CITYINFO
VALUES ('430', 'Hvalv??k');
INSERT INTO CITYINFO
VALUES ('435', 'Streymnes');
INSERT INTO CITYINFO
VALUES ('436', 'Saksun');
INSERT INTO CITYINFO
VALUES ('437', 'Nesv??k');
INSERT INTO CITYINFO
VALUES ('438', 'Langasandur');
INSERT INTO CITYINFO
VALUES ('440', 'Haldarsv??k');
INSERT INTO CITYINFO
VALUES ('445', 'Tj??rnuv??k');
INSERT INTO CITYINFO
VALUES ('450', 'Oyri');
INSERT INTO CITYINFO
VALUES ('460', 'Nordsk??li');
INSERT INTO CITYINFO
VALUES ('465', 'Svin??ir');
INSERT INTO CITYINFO
VALUES ('466', 'Lj??s??');
INSERT INTO CITYINFO
VALUES ('470', 'Eidi');
INSERT INTO CITYINFO
VALUES ('475', 'Funningur');
INSERT INTO CITYINFO
VALUES ('476', 'Gj??gv');
INSERT INTO CITYINFO
VALUES ('477', 'Funningsfj??rdur');
INSERT INTO CITYINFO
VALUES ('478', 'Elduv??k');
INSERT INTO CITYINFO
VALUES ('480', 'Sk??li');
INSERT INTO CITYINFO
VALUES ('485', 'Sk??lafj??rdur');
INSERT INTO CITYINFO
VALUES ('490', 'Strendur');
INSERT INTO CITYINFO
VALUES ('494', 'Innan Glyvur');
INSERT INTO CITYINFO
VALUES ('495', 'Kolbanargj??gv');
INSERT INTO CITYINFO
VALUES ('496', 'Morskranes');
INSERT INTO CITYINFO
VALUES ('497', 'Selatrad');
INSERT INTO CITYINFO
VALUES ('510', 'G??ta');
INSERT INTO CITYINFO
VALUES ('511', 'G??tugj??gv');
INSERT INTO CITYINFO
VALUES ('512', 'Nordrag??ta');
INSERT INTO CITYINFO
VALUES ('513', 'Sydrug??ta');
INSERT INTO CITYINFO
VALUES ('515', 'G??ta');
INSERT INTO CITYINFO
VALUES ('520', 'Leirv??k');
INSERT INTO CITYINFO
VALUES ('530', 'Fuglafj??rdur');
INSERT INTO CITYINFO
VALUES ('535', 'Fuglafj??rdur');
INSERT INTO CITYINFO
VALUES ('600', 'Saltangar??');
INSERT INTO CITYINFO
VALUES ('610', 'Saltangar??');
INSERT INTO CITYINFO
VALUES ('620', 'Runav??k');
INSERT INTO CITYINFO
VALUES ('625', 'Glyvrar');
INSERT INTO CITYINFO
VALUES ('626', 'Lambareidi');
INSERT INTO CITYINFO
VALUES ('627', 'Lambi');
INSERT INTO CITYINFO
VALUES ('640', 'Rituv??k');
INSERT INTO CITYINFO
VALUES ('645', '??duv??k');
INSERT INTO CITYINFO
VALUES ('650', 'Toftir');
INSERT INTO CITYINFO
VALUES ('655', 'Nes, Eysturoy');
INSERT INTO CITYINFO
VALUES ('656', 'Saltnes');
INSERT INTO CITYINFO
VALUES ('660', 'S??ldarfj??rdur');
INSERT INTO CITYINFO
VALUES ('665', 'Skipanes');
INSERT INTO CITYINFO
VALUES ('666', 'G??tueidi');
INSERT INTO CITYINFO
VALUES ('690', 'Oyndarfj??rdur');
INSERT INTO CITYINFO
VALUES ('695', 'Hellur');
INSERT INTO CITYINFO
VALUES ('700', 'Klaksv??k');
INSERT INTO CITYINFO
VALUES ('710', 'Klaksv??k');
INSERT INTO CITYINFO
VALUES ('725', 'Nordoyri');
INSERT INTO CITYINFO
VALUES ('726', '??nir');
INSERT INTO CITYINFO
VALUES ('727', '??rnafj??rdur');
INSERT INTO CITYINFO
VALUES ('730', 'Norddepil');
INSERT INTO CITYINFO
VALUES ('735', 'Depil');
INSERT INTO CITYINFO
VALUES ('736', 'Nordtoftir');
INSERT INTO CITYINFO
VALUES ('737', 'M??li');
INSERT INTO CITYINFO
VALUES ('740', 'Hvannasund');
INSERT INTO CITYINFO
VALUES ('750', 'Vidareidi');
INSERT INTO CITYINFO
VALUES ('765', 'Svinoy');
INSERT INTO CITYINFO
VALUES ('766', 'Kirkja');
INSERT INTO CITYINFO
VALUES ('767', 'Hattarv??k');
INSERT INTO CITYINFO
VALUES ('780', 'Kunoy');
INSERT INTO CITYINFO
VALUES ('785', 'Haraldssund');
INSERT INTO CITYINFO
VALUES ('795', 'Sydradalur, Kalsoy');
INSERT INTO CITYINFO
VALUES ('796', 'H??sar');
INSERT INTO CITYINFO
VALUES ('797', 'Mikladalur');
INSERT INTO CITYINFO
VALUES ('798', 'Tr??llanes');
INSERT INTO CITYINFO
VALUES ('810', 'Tv??royri');
INSERT INTO CITYINFO
VALUES ('825', 'Frodba');
INSERT INTO CITYINFO
VALUES ('826', 'Trongisv??gur');
INSERT INTO CITYINFO
VALUES ('827', '??rav??k');
INSERT INTO CITYINFO
VALUES ('850', 'Hvalba');
INSERT INTO CITYINFO
VALUES ('860', 'Sandv??k');
INSERT INTO CITYINFO
VALUES ('870', 'F??mjin');

UNLOCK
    TABLES;
CREATE
    DATABASE IF NOT EXISTS `test`;
USE
    `test`;
CREATE TABLE test.CITYINFO LIKE startcode.CITYINFO;
CREATE TABLE test.ADDRESS LIKE startcode.ADDRESS;
CREATE TABLE test.PERSON LIKE startcode.PERSON;
CREATE TABLE test.HOBBY LIKE startcode.HOBBY;
CREATE TABLE test.PHONE LIKE startcode.PHONE;
CREATE TABLE test.PERSON_HOBBY LIKE startcode.PERSON_HOBBY;

