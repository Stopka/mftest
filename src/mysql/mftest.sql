-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Počítač: mftest-mariadb
-- Vytvořeno: Pon 01. dub 2019, 12:25
-- Verze serveru: 10.3.10-MariaDB-1:10.3.10+maria~bionic
-- Verze PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `mftest`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `bool_field_value`
--

CREATE TABLE `bool_field_value` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `value` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `bool_field_value`
--

INSERT INTO `bool_field_value` (`id`, `value`) VALUES
(0x4cb83073136a4947a8045479e951251f, 0),
(0x7d97e343b4034ff49fd08d29743c38ea, 1),
(0xdbe4a30071a54481abfbdb7473b3fdbd, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `field`
--

CREATE TABLE `field` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `units_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `default_value_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `title_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `description_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `internal_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `field`
--

INSERT INTO `field` (`id`, `units_id`, `default_value_id`, `title_id`, `description_id`, `internal_name`, `type`) VALUES
(0x0650bcffb77e4184a6eb8017999f87c8, 0xc0bb9b387af74e57ad7157c2533f3536, 0x1869a200aead40938e0333133b9e3633, 0xffea66c429b24b88aee69330120734e5, 0x2caef20a825145fe864ce43554c779b7, 'size', 'intfieldentity'),
(0x2821d211d4a14170baa6a7297d9d9b93, 0xa096086d2ccb487994b17997df8e52d6, 0x7d97e343b4034ff49fd08d29743c38ea, 0x5e85d009d5ff4d9e86cd52a41a913f5b, 0x30aad313cada4b6d8de90ab991d61392, 'lte', 'boolfieldentity'),
(0x45acae74453b4de5954cddda79336850, 0xa2b78f842b294a4db176b6f377db80e8, 0x1d0eae4bb88d4baf92405edb94c89337, 0x3b0f16f693f24692abdfe82ff9daddef, 0x8dd79823f11c4cc893301411a3bdd65e, 'os', 'singleselectfieldentity'),
(0x722954e9dad341e6a38c9eb62f705e3d, 0xf630e5355297460e94c5936f491f84b0, 0x4cb83073136a4947a8045479e951251f, 0xe86f6834a12d4c22b19193ab8035ff4d, 0x9058d907e7bc46f38b095f3a1a0bea53, 'contract only', 'boolfieldentity'),
(0x828c32be73f249a0b1d9cc97d0dc6af2, 0x39352ad90f97497698da83de0747e64f, 0x2fe61f7819d44b6a92b2a17b4c953840, 0x7685ce7ed1b840e6b2852d272131e304, 0x9a00898394d7430b954f98c1efcd7da9, 'customer type', 'multiselectfieldentity'),
(0xd74fdc6c56504e2d873a6b0c069e26f2, 0x80769883d1ca4cb58514242d3a84f093, 0xc2064c874ed8482b81637e573a34d127, 0xefbc8e37775548358dce52ad6e73af3b, 0x6f35c02a10604f3eae3cb36af26262e0, 'weight', 'floatfieldentity');

-- --------------------------------------------------------

--
-- Struktura tabulky `field_value`
--

CREATE TABLE `field_value` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `field_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `field_value`
--

INSERT INTO `field_value` (`id`, `field_id`, `type`) VALUES
(0x15d1ef3eabc843e68ac779a461e45950, 0xd74fdc6c56504e2d873a6b0c069e26f2, 'floatfieldvalueentity'),
(0x1869a200aead40938e0333133b9e3633, 0x0650bcffb77e4184a6eb8017999f87c8, 'intfieldvalueentity'),
(0x1d0eae4bb88d4baf92405edb94c89337, 0x45acae74453b4de5954cddda79336850, 'singleselectfieldvalueentity'),
(0x1f9eb8f397754ec99e018d672d09fcb0, 0x0650bcffb77e4184a6eb8017999f87c8, 'intfieldvalueentity'),
(0x2fe61f7819d44b6a92b2a17b4c953840, 0x828c32be73f249a0b1d9cc97d0dc6af2, 'multiselectfieldvalueentity'),
(0x4cb83073136a4947a8045479e951251f, 0x722954e9dad341e6a38c9eb62f705e3d, 'boolfieldvalueentity'),
(0x7d97e343b4034ff49fd08d29743c38ea, 0x2821d211d4a14170baa6a7297d9d9b93, 'boolfieldvalueentity'),
(0xc2064c874ed8482b81637e573a34d127, 0xd74fdc6c56504e2d873a6b0c069e26f2, 'floatfieldvalueentity'),
(0xdbe4a30071a54481abfbdb7473b3fdbd, 0x2821d211d4a14170baa6a7297d9d9b93, 'boolfieldvalueentity'),
(0xf2285a0a6e444969938c13e164e8abd0, 0x45acae74453b4de5954cddda79336850, 'singleselectfieldvalueentity');

-- --------------------------------------------------------

--
-- Struktura tabulky `float_field_value`
--

CREATE TABLE `float_field_value` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `value` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `float_field_value`
--

INSERT INTO `float_field_value` (`id`, `value`) VALUES
(0x15d1ef3eabc843e68ac779a461e45950, 150.5),
(0xc2064c874ed8482b81637e573a34d127, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `int_field_value`
--

CREATE TABLE `int_field_value` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `int_field_value`
--

INSERT INTO `int_field_value` (`id`, `value`) VALUES
(0x1869a200aead40938e0333133b9e3633, 0),
(0x1f9eb8f397754ec99e018d672d09fcb0, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `language`
--

CREATE TABLE `language` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso6391` varchar(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `language`
--

INSERT INTO `language` (`id`, `name`, `iso6391`) VALUES
(0x71e19dd872b244db8e20fb7186e1275e, 'Czech', 'cs');

-- --------------------------------------------------------

--
-- Struktura tabulky `multilanguage_string`
--

CREATE TABLE `multilanguage_string` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `multilanguage_string`
--

INSERT INTO `multilanguage_string` (`id`) VALUES
(0x2caef20a825145fe864ce43554c779b7),
(0x30aad313cada4b6d8de90ab991d61392),
(0x39352ad90f97497698da83de0747e64f),
(0x3a1be6d047fa440092e2c4bf63b2064b),
(0x3b0f16f693f24692abdfe82ff9daddef),
(0x55619e8619a34c1f8951f749455c71c4),
(0x5e85d009d5ff4d9e86cd52a41a913f5b),
(0x628217fe23e2482faa05612e1cd51676),
(0x6f35c02a10604f3eae3cb36af26262e0),
(0x766598c1ab50437fa1870024bc3e53db),
(0x7685ce7ed1b840e6b2852d272131e304),
(0x80769883d1ca4cb58514242d3a84f093),
(0x8dd79823f11c4cc893301411a3bdd65e),
(0x9058d907e7bc46f38b095f3a1a0bea53),
(0x98abc2f1803d4ed5a26da8d3571273c7),
(0x9a00898394d7430b954f98c1efcd7da9),
(0xa096086d2ccb487994b17997df8e52d6),
(0xa2b78f842b294a4db176b6f377db80e8),
(0xc0bb9b387af74e57ad7157c2533f3536),
(0xc2c52072cef047c191d2a15b23d6221a),
(0xe86f6834a12d4c22b19193ab8035ff4d),
(0xefbc8e37775548358dce52ad6e73af3b),
(0xf60d4dbd1b464000bb3d4cca10603070),
(0xf630e5355297460e94c5936f491f84b0),
(0xffea66c429b24b88aee69330120734e5);

-- --------------------------------------------------------

--
-- Struktura tabulky `multi_select_field_value`
--

CREATE TABLE `multi_select_field_value` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `multi_select_field_value`
--

INSERT INTO `multi_select_field_value` (`id`) VALUES
(0x2fe61f7819d44b6a92b2a17b4c953840);

-- --------------------------------------------------------

--
-- Struktura tabulky `option_selection`
--

CREATE TABLE `option_selection` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `select_field_value_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `select_option_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `option_selection`
--

INSERT INTO `option_selection` (`id`, `select_field_value_id`, `select_option_id`) VALUES
(0x41eb578280314b7ab3178c254c0f43a1, 0xf2285a0a6e444969938c13e164e8abd0, 0xf79824e96ac44367b2798cc1cd18452e);

-- --------------------------------------------------------

--
-- Struktura tabulky `product`
--

CREATE TABLE `product` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `type_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `title_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `description_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `internal_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `product`
--

INSERT INTO `product` (`id`, `type_id`, `title_id`, `description_id`, `internal_name`) VALUES
(0x7b6f324b7a444dfda37557d3e9a66db2, 0xe7edd160555b48c0a20deb9adb3b9607, 0x55619e8619a34c1f8951f749455c71c4, 0x766598c1ab50437fa1870024bc3e53db, 'iphone S2');

-- --------------------------------------------------------

--
-- Struktura tabulky `product_parameter`
--

CREATE TABLE `product_parameter` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `product_type_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `field_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `product_parameter`
--

INSERT INTO `product_parameter` (`id`, `product_type_id`, `field_id`) VALUES
(0x3afdfffbd588419e92cf43ae139f01eb, 0xe7edd160555b48c0a20deb9adb3b9607, 0x0650bcffb77e4184a6eb8017999f87c8),
(0x4de1131495524626baa451bd561b4074, 0x7c7a5fde68b548f1b1067088792f41c8, 0x828c32be73f249a0b1d9cc97d0dc6af2),
(0xcc36042231c74aac99a8e520299858c4, 0xe7edd160555b48c0a20deb9adb3b9607, 0xd74fdc6c56504e2d873a6b0c069e26f2),
(0xcd39c9a9fbb9451fa041c673f06fea4b, 0xe7edd160555b48c0a20deb9adb3b9607, 0x45acae74453b4de5954cddda79336850),
(0xce90e8c097074841bd69e076de185d17, 0x7c7a5fde68b548f1b1067088792f41c8, 0x722954e9dad341e6a38c9eb62f705e3d),
(0xdfffa57b7a134e5fb3327eabe01fd690, 0xe7edd160555b48c0a20deb9adb3b9607, 0x2821d211d4a14170baa6a7297d9d9b93);

-- --------------------------------------------------------

--
-- Struktura tabulky `product_parameter_value`
--

CREATE TABLE `product_parameter_value` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `product_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `product_parameter_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `field_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `field_value_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `product_parameter_value`
--

INSERT INTO `product_parameter_value` (`id`, `product_id`, `product_parameter_id`, `field_id`, `field_value_id`) VALUES
(0x7a895a68bb3d44c3aedc2152faf6b3cf, 0x7b6f324b7a444dfda37557d3e9a66db2, 0xcd39c9a9fbb9451fa041c673f06fea4b, 0x45acae74453b4de5954cddda79336850, 0xf2285a0a6e444969938c13e164e8abd0),
(0x9c50b992a7094832889c896f069183d1, 0x7b6f324b7a444dfda37557d3e9a66db2, 0xdfffa57b7a134e5fb3327eabe01fd690, 0x2821d211d4a14170baa6a7297d9d9b93, 0xdbe4a30071a54481abfbdb7473b3fdbd),
(0xac6b7a1b313b4262a5bcdaf7921108eb, 0x7b6f324b7a444dfda37557d3e9a66db2, 0xcc36042231c74aac99a8e520299858c4, 0xd74fdc6c56504e2d873a6b0c069e26f2, 0x15d1ef3eabc843e68ac779a461e45950),
(0xe1d46574bd574ae688a381d83e49fc33, 0x7b6f324b7a444dfda37557d3e9a66db2, 0x3afdfffbd588419e92cf43ae139f01eb, 0x0650bcffb77e4184a6eb8017999f87c8, 0x1f9eb8f397754ec99e018d672d09fcb0);

-- --------------------------------------------------------

--
-- Struktura tabulky `product_type`
--

CREATE TABLE `product_type` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `internal_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `product_type`
--

INSERT INTO `product_type` (`id`, `internal_name`) VALUES
(0xe7edd160555b48c0a20deb9adb3b9607, 'device'),
(0x7c7a5fde68b548f1b1067088792f41c8, 'postpaid tariff');

-- --------------------------------------------------------

--
-- Struktura tabulky `select_field_value`
--

CREATE TABLE `select_field_value` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `select_field_value`
--

INSERT INTO `select_field_value` (`id`) VALUES
(0x1d0eae4bb88d4baf92405edb94c89337),
(0x2fe61f7819d44b6a92b2a17b4c953840),
(0xf2285a0a6e444969938c13e164e8abd0);

-- --------------------------------------------------------

--
-- Struktura tabulky `select_option`
--

CREATE TABLE `select_option` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `select_field_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `title_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `select_option`
--

INSERT INTO `select_option` (`id`, `select_field_id`, `title_id`) VALUES
(0x07dbe811ad5147f88b7f1b457dd56530, 0x828c32be73f249a0b1d9cc97d0dc6af2, 0x3a1be6d047fa440092e2c4bf63b2064b),
(0x0aff2fac4ff547c89b3bf39f34e27df2, 0x828c32be73f249a0b1d9cc97d0dc6af2, 0x628217fe23e2482faa05612e1cd51676),
(0x3ee4bbcd44434af7a5d3a682cadc05db, 0x45acae74453b4de5954cddda79336850, 0xf60d4dbd1b464000bb3d4cca10603070),
(0xb923571a740c42e4addecad12a3e51c4, 0x828c32be73f249a0b1d9cc97d0dc6af2, 0xc2c52072cef047c191d2a15b23d6221a),
(0xf79824e96ac44367b2798cc1cd18452e, 0x45acae74453b4de5954cddda79336850, 0x98abc2f1803d4ed5a26da8d3571273c7);

-- --------------------------------------------------------

--
-- Struktura tabulky `single_select_field_value`
--

CREATE TABLE `single_select_field_value` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `single_select_field_value`
--

INSERT INTO `single_select_field_value` (`id`) VALUES
(0x1d0eae4bb88d4baf92405edb94c89337),
(0xf2285a0a6e444969938c13e164e8abd0);

-- --------------------------------------------------------

--
-- Struktura tabulky `string_field_value`
--

CREATE TABLE `string_field_value` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `string_translation`
--

CREATE TABLE `string_translation` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid_binary)',
  `language_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `multilanguage_string_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid_binary)',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vypisuji data pro tabulku `string_translation`
--

INSERT INTO `string_translation` (`id`, `language_id`, `multilanguage_string_id`, `value`) VALUES
(0x01fabb2727cf420bb5da8fa539284b45, 0x71e19dd872b244db8e20fb7186e1275e, 0xefbc8e37775548358dce52ad6e73af3b, 'Váha'),
(0x0f4e5ef3a881440d8b981d896edeae4f, 0x71e19dd872b244db8e20fb7186e1275e, 0xc2c52072cef047c191d2a15b23d6221a, 'Student'),
(0x1042075b43604f828d3ac72b787381d6, 0x71e19dd872b244db8e20fb7186e1275e, 0xffea66c429b24b88aee69330120734e5, 'Rozměr'),
(0x36edb0fc005c4b869daddfd8c43e4db4, 0x71e19dd872b244db8e20fb7186e1275e, 0x5e85d009d5ff4d9e86cd52a41a913f5b, 'Podpora LTE'),
(0x3d54aae3e68e4abfa37d675edd55d968, 0x71e19dd872b244db8e20fb7186e1275e, 0x3a1be6d047fa440092e2c4bf63b2064b, 'Koncový'),
(0x68ae79326af34bf583607bf69c52ed84, 0x71e19dd872b244db8e20fb7186e1275e, 0x98abc2f1803d4ed5a26da8d3571273c7, 'iOS'),
(0x6c0ac392fe2b4362b25dd97b49a3a451, 0x71e19dd872b244db8e20fb7186e1275e, 0xc0bb9b387af74e57ad7157c2533f3536, 'palců'),
(0x6e798559dfd142e3a87c1a027b1a511c, 0x71e19dd872b244db8e20fb7186e1275e, 0x80769883d1ca4cb58514242d3a84f093, 'gramů'),
(0x7debde97bb5d4697a42b71c71d395596, 0x71e19dd872b244db8e20fb7186e1275e, 0x7685ce7ed1b840e6b2852d272131e304, 'Typ zákazníka'),
(0x9053453caeba4c89b24868248fbe597c, 0x71e19dd872b244db8e20fb7186e1275e, 0xf60d4dbd1b464000bb3d4cca10603070, 'Android'),
(0xb4d908018e3f4b9bb4e4bd2d1ee51ebe, 0x71e19dd872b244db8e20fb7186e1275e, 0xe86f6834a12d4c22b19193ab8035ff4d, 'Pouze se smlouvou'),
(0xb82aee02e0e1463ea9ad8f7a8b4715c7, 0x71e19dd872b244db8e20fb7186e1275e, 0x3b0f16f693f24692abdfe82ff9daddef, 'Operační systém'),
(0xd465db99f8114da8a15d3dacb291905c, 0x71e19dd872b244db8e20fb7186e1275e, 0x628217fe23e2482faa05612e1cd51676, 'Firemní');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `bool_field_value`
--
ALTER TABLE `bool_field_value`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5BF54558B2A3EFCD` (`internal_name`),
  ADD KEY `IDX_5BF5455899387CE8` (`units_id`),
  ADD KEY `IDX_5BF54558FF648BEC` (`default_value_id`),
  ADD KEY `IDX_5BF54558A9F87BD` (`title_id`),
  ADD KEY `IDX_5BF54558D9F966B` (`description_id`);

--
-- Klíče pro tabulku `field_value`
--
ALTER TABLE `field_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_36D0CECF443707B0` (`field_id`);

--
-- Klíče pro tabulku `float_field_value`
--
ALTER TABLE `float_field_value`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `int_field_value`
--
ALTER TABLE `int_field_value`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4DB71B55E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_D4DB71B5B9A1388F` (`iso6391`);

--
-- Klíče pro tabulku `multilanguage_string`
--
ALTER TABLE `multilanguage_string`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `multi_select_field_value`
--
ALTER TABLE `multi_select_field_value`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `option_selection`
--
ALTER TABLE `option_selection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_473E1C5791B7AF50` (`select_field_value_id`),
  ADD KEY `IDX_473E1C57C6BD8B12` (`select_option_id`);

--
-- Klíče pro tabulku `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D34A04ADB2A3EFCD` (`internal_name`),
  ADD UNIQUE KEY `UNIQ_D34A04ADA9F87BD` (`title_id`),
  ADD UNIQUE KEY `UNIQ_D34A04ADD9F966B` (`description_id`),
  ADD KEY `IDX_D34A04ADC54C8C93` (`type_id`);

--
-- Klíče pro tabulku `product_parameter`
--
ALTER TABLE `product_parameter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4437279D14959723` (`product_type_id`),
  ADD KEY `IDX_4437279D443707B0` (`field_id`);

--
-- Klíče pro tabulku `product_parameter_value`
--
ALTER TABLE `product_parameter_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5F39A7252F183C6F` (`field_value_id`),
  ADD KEY `IDX_5F39A7254584665A` (`product_id`),
  ADD KEY `IDX_5F39A725F1F2F9BD` (`product_parameter_id`),
  ADD KEY `IDX_5F39A725443707B0` (`field_id`);

--
-- Klíče pro tabulku `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1367588B2A3EFCD` (`internal_name`);

--
-- Klíče pro tabulku `select_field_value`
--
ALTER TABLE `select_field_value`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `select_option`
--
ALTER TABLE `select_option`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A6969C5DA9F87BD` (`title_id`),
  ADD KEY `IDX_A6969C5D565EA96E` (`select_field_id`);

--
-- Klíče pro tabulku `single_select_field_value`
--
ALTER TABLE `single_select_field_value`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `string_field_value`
--
ALTER TABLE `string_field_value`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `string_translation`
--
ALTER TABLE `string_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9A049C7C82F1BAF4` (`language_id`),
  ADD KEY `IDX_9A049C7CC5CDA23B` (`multilanguage_string_id`);

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `bool_field_value`
--
ALTER TABLE `bool_field_value`
  ADD CONSTRAINT `FK_195487EBBF396750` FOREIGN KEY (`id`) REFERENCES `field_value` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `field`
--
ALTER TABLE `field`
  ADD CONSTRAINT `FK_5BF5455899387CE8` FOREIGN KEY (`units_id`) REFERENCES `multilanguage_string` (`id`),
  ADD CONSTRAINT `FK_5BF54558A9F87BD` FOREIGN KEY (`title_id`) REFERENCES `multilanguage_string` (`id`),
  ADD CONSTRAINT `FK_5BF54558D9F966B` FOREIGN KEY (`description_id`) REFERENCES `multilanguage_string` (`id`),
  ADD CONSTRAINT `FK_5BF54558FF648BEC` FOREIGN KEY (`default_value_id`) REFERENCES `field_value` (`id`);

--
-- Omezení pro tabulku `field_value`
--
ALTER TABLE `field_value`
  ADD CONSTRAINT `FK_36D0CECF443707B0` FOREIGN KEY (`field_id`) REFERENCES `field` (`id`);

--
-- Omezení pro tabulku `float_field_value`
--
ALTER TABLE `float_field_value`
  ADD CONSTRAINT `FK_EDCC0B99BF396750` FOREIGN KEY (`id`) REFERENCES `field_value` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `int_field_value`
--
ALTER TABLE `int_field_value`
  ADD CONSTRAINT `FK_CD2C278EBF396750` FOREIGN KEY (`id`) REFERENCES `field_value` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `multi_select_field_value`
--
ALTER TABLE `multi_select_field_value`
  ADD CONSTRAINT `FK_59CBA6C4BF396750` FOREIGN KEY (`id`) REFERENCES `field_value` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `option_selection`
--
ALTER TABLE `option_selection`
  ADD CONSTRAINT `FK_473E1C5791B7AF50` FOREIGN KEY (`select_field_value_id`) REFERENCES `select_field_value` (`id`),
  ADD CONSTRAINT `FK_473E1C57C6BD8B12` FOREIGN KEY (`select_option_id`) REFERENCES `select_option` (`id`);

--
-- Omezení pro tabulku `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04ADA9F87BD` FOREIGN KEY (`title_id`) REFERENCES `multilanguage_string` (`id`),
  ADD CONSTRAINT `FK_D34A04ADC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `product_type` (`id`),
  ADD CONSTRAINT `FK_D34A04ADD9F966B` FOREIGN KEY (`description_id`) REFERENCES `multilanguage_string` (`id`);

--
-- Omezení pro tabulku `product_parameter`
--
ALTER TABLE `product_parameter`
  ADD CONSTRAINT `FK_4437279D14959723` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`),
  ADD CONSTRAINT `FK_4437279D443707B0` FOREIGN KEY (`field_id`) REFERENCES `field` (`id`);

--
-- Omezení pro tabulku `product_parameter_value`
--
ALTER TABLE `product_parameter_value`
  ADD CONSTRAINT `FK_5F39A7252F183C6F` FOREIGN KEY (`field_value_id`) REFERENCES `field_value` (`id`),
  ADD CONSTRAINT `FK_5F39A725443707B0` FOREIGN KEY (`field_id`) REFERENCES `field` (`id`),
  ADD CONSTRAINT `FK_5F39A7254584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_5F39A725F1F2F9BD` FOREIGN KEY (`product_parameter_id`) REFERENCES `product_parameter` (`id`);

--
-- Omezení pro tabulku `select_field_value`
--
ALTER TABLE `select_field_value`
  ADD CONSTRAINT `FK_B52D9E7CBF396750` FOREIGN KEY (`id`) REFERENCES `field_value` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `select_option`
--
ALTER TABLE `select_option`
  ADD CONSTRAINT `FK_A6969C5D565EA96E` FOREIGN KEY (`select_field_id`) REFERENCES `field` (`id`),
  ADD CONSTRAINT `FK_A6969C5DA9F87BD` FOREIGN KEY (`title_id`) REFERENCES `multilanguage_string` (`id`);

--
-- Omezení pro tabulku `single_select_field_value`
--
ALTER TABLE `single_select_field_value`
  ADD CONSTRAINT `FK_560FE94ABF396750` FOREIGN KEY (`id`) REFERENCES `field_value` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `string_field_value`
--
ALTER TABLE `string_field_value`
  ADD CONSTRAINT `FK_18BD17DCBF396750` FOREIGN KEY (`id`) REFERENCES `field_value` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `string_translation`
--
ALTER TABLE `string_translation`
  ADD CONSTRAINT `FK_9A049C7C82F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `FK_9A049C7CC5CDA23B` FOREIGN KEY (`multilanguage_string_id`) REFERENCES `multilanguage_string` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
