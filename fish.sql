/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 127.0.0.1:3306
 Source Schema         : fish

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 28/03/2021 19:49:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `position` mediumint(9) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (1, 'Organic Fruit, Vegetables and Meat', 'shop now', NULL, 'banners\\March2021\\3pErfPbBCpENhdVF2omR.jpg', '2021-03-27 19:58:44', '2021-03-27 20:26:13', 1);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `position` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE,
  INDEX `categories_parent_id_foreign`(`parent_id`) USING BTREE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, NULL, 1, 'Category 1', 'category-1', '2021-03-14 08:26:22', '2021-03-14 08:26:22', 1);
INSERT INTO `categories` VALUES (2, NULL, 1, 'Category 2', 'category-2', '2021-03-14 08:26:22', '2021-03-14 08:26:22', 1);

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_rows_data_type_id_foreign`(`data_type_id`) USING BTREE,
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
INSERT INTO `data_rows` VALUES (1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3);
INSERT INTO `data_rows` VALUES (4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5);
INSERT INTO `data_rows` VALUES (6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6);
INSERT INTO `data_rows` VALUES (7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7);
INSERT INTO `data_rows` VALUES (8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8);
INSERT INTO `data_rows` VALUES (9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10);
INSERT INTO `data_rows` VALUES (10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11);
INSERT INTO `data_rows` VALUES (11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12);
INSERT INTO `data_rows` VALUES (12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5);
INSERT INTO `data_rows` VALUES (21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9);
INSERT INTO `data_rows` VALUES (22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2);
INSERT INTO `data_rows` VALUES (24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3);
INSERT INTO `data_rows` VALUES (25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5);
INSERT INTO `data_rows` VALUES (27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 7);
INSERT INTO `data_rows` VALUES (28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);
INSERT INTO `data_rows` VALUES (29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4);
INSERT INTO `data_rows` VALUES (33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5);
INSERT INTO `data_rows` VALUES (34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6);
INSERT INTO `data_rows` VALUES (35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7);
INSERT INTO `data_rows` VALUES (36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8);
INSERT INTO `data_rows` VALUES (37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9);
INSERT INTO `data_rows` VALUES (38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10);
INSERT INTO `data_rows` VALUES (39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11);
INSERT INTO `data_rows` VALUES (40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12);
INSERT INTO `data_rows` VALUES (41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13);
INSERT INTO `data_rows` VALUES (42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14);
INSERT INTO `data_rows` VALUES (43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15);
INSERT INTO `data_rows` VALUES (44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2);
INSERT INTO `data_rows` VALUES (46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3);
INSERT INTO `data_rows` VALUES (47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4);
INSERT INTO `data_rows` VALUES (48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5);
INSERT INTO `data_rows` VALUES (49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6);
INSERT INTO `data_rows` VALUES (50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7);
INSERT INTO `data_rows` VALUES (51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8);
INSERT INTO `data_rows` VALUES (52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9);
INSERT INTO `data_rows` VALUES (53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10);
INSERT INTO `data_rows` VALUES (54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11);
INSERT INTO `data_rows` VALUES (55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12);
INSERT INTO `data_rows` VALUES (56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (57, 7, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:100\"}}', 2);
INSERT INTO `data_rows` VALUES (58, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 4);
INSERT INTO `data_rows` VALUES (59, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5);
INSERT INTO `data_rows` VALUES (60, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (61, 9, 'value', 'text', 'Value', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:100\"}}', 2);
INSERT INTO `data_rows` VALUES (62, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 5);
INSERT INTO `data_rows` VALUES (63, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 6);
INSERT INTO `data_rows` VALUES (64, 9, 'feature_id', 'text', 'Feature Id', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric\"}}', 4);
INSERT INTO `data_rows` VALUES (65, 9, 'feature_option_belongsto_feature_relationship', 'relationship', 'features', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Feature\",\"table\":\"features\",\"type\":\"belongsTo\",\"column\":\"feature_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3);
INSERT INTO `data_rows` VALUES (66, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (67, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:100\"}}', 2);
INSERT INTO `data_rows` VALUES (68, 11, 'scientific_name', 'text', 'Scientific Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"nullable|max:100\"}}', 3);
INSERT INTO `data_rows` VALUES (69, 11, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"nullable|max:30000\"}}', 4);
INSERT INTO `data_rows` VALUES (70, 11, 'photos', 'multiple_images', 'Photos', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 5);
INSERT INTO `data_rows` VALUES (71, 11, 'nutrition_photo', 'image', 'Nutrition Photo', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 6);
INSERT INTO `data_rows` VALUES (72, 11, 'category_id', 'text', 'Category Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric\"}}', 7);
INSERT INTO `data_rows` VALUES (73, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 11);
INSERT INTO `data_rows` VALUES (74, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12);
INSERT INTO `data_rows` VALUES (75, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 13);
INSERT INTO `data_rows` VALUES (76, 11, 'product_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8);
INSERT INTO `data_rows` VALUES (77, 11, 'product_belongstomany_feature_option_relationship', 'relationship', 'Options', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\FeatureOption\",\"table\":\"feature_options\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"value\",\"pivot_table\":\"option_product\",\"pivot\":\"1\",\"taggable\":\"on\"}', 9);
INSERT INTO `data_rows` VALUES (78, 7, 'feature_hasmany_feature_option_relationship', 'relationship', 'options', 0, 1, 1, 1, 0, 1, '{\"model\":\"App\\\\Models\\\\FeatureOption\",\"table\":\"feature_options\",\"type\":\"hasMany\",\"column\":\"feature_id\",\"key\":\"id\",\"label\":\"value\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3);
INSERT INTO `data_rows` VALUES (79, 11, 'is_featured', 'checkbox', 'Is Featured', 0, 1, 1, 1, 1, 1, 'null', 10);
INSERT INTO `data_rows` VALUES (80, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (81, 12, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:100\"}}', 2);
INSERT INTO `data_rows` VALUES (82, 12, 'link', 'text', 'Link', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:150|url\"}}', 3);
INSERT INTO `data_rows` VALUES (83, 12, 'position', 'number', 'Position', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"numeric|min:1|max:100\"}}', 4);
INSERT INTO `data_rows` VALUES (84, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (85, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6);
INSERT INTO `data_rows` VALUES (86, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (87, 13, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:100\"}}', 2);
INSERT INTO `data_rows` VALUES (88, 13, 'subtitle', 'text', 'Subtitle', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"nullable|max:100\"}}', 3);
INSERT INTO `data_rows` VALUES (89, 13, 'url', 'text', 'Url', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"nullable|max:150\"}}', 4);
INSERT INTO `data_rows` VALUES (90, 13, 'photo', 'image', 'Photo', 0, 1, 1, 1, 1, 1, '{\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 5);
INSERT INTO `data_rows` VALUES (91, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 7);
INSERT INTO `data_rows` VALUES (92, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);
INSERT INTO `data_rows` VALUES (93, 13, 'position', 'number', 'Position', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"numeric|min:1|max:100\"}}', 6);
INSERT INTO `data_rows` VALUES (94, 4, 'position', 'number', 'Position', 0, 1, 1, 1, 1, 1, '{\"default\":1,\"validation\":{\"rule\":\"numeric|min:1|max:100\"}}', 6);
INSERT INTO `data_rows` VALUES (95, 7, 'position', 'text', 'Position', 0, 1, 1, 1, 1, 1, '{}', 5);

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `data_types_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `data_types_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES (1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `data_types` VALUES (2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `data_types` VALUES (3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `data_types` VALUES (4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"position\",\"order_display_column\":\"name\",\"order_direction\":\"desc\",\"default_search_key\":\"name\",\"scope\":null}', '2021-03-14 08:26:22', '2021-03-27 07:57:19');
INSERT INTO `data_types` VALUES (5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `data_types` VALUES (6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `data_types` VALUES (7, 'features', 'features', 'Feature', 'Features', 'voyager-params', 'App\\Models\\Feature', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"position\",\"order_display_column\":\"title\",\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}', '2021-03-14 08:49:15', '2021-03-27 07:57:32');
INSERT INTO `data_types` VALUES (9, 'feature_options', 'feature-options', 'Feature Option', 'Feature Options', 'voyager-list', 'App\\Models\\FeatureOption', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"value\",\"order_direction\":\"desc\",\"default_search_key\":\"value\",\"scope\":null}', '2021-03-14 08:59:13', '2021-03-14 09:19:23');
INSERT INTO `data_types` VALUES (11, 'products', 'products', 'Product', 'Products', 'voyager-basket', 'App\\Models\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-03-14 09:46:34', '2021-03-14 10:40:20');
INSERT INTO `data_types` VALUES (12, 'socials', 'socials', 'Social', 'Socials', 'voyager-world', 'App\\Models\\Social', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"title\",\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}', '2021-03-27 07:40:08', '2021-03-27 07:47:10');
INSERT INTO `data_types` VALUES (13, 'banners', 'banners', 'Banner', 'Banners', 'voyager-images', 'App\\Models\\Banner', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"position\",\"order_display_column\":\"title\",\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}', '2021-03-27 07:46:36', '2021-03-27 20:25:59');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feature_options
-- ----------------------------
DROP TABLE IF EXISTS `feature_options`;
CREATE TABLE `feature_options`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `feature_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `feature_options_feature_id_index`(`feature_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feature_options
-- ----------------------------
INSERT INTO `feature_options` VALUES (1, 'test option', '2021-03-14 09:18:03', '2021-03-14 09:19:34', 1);

-- ----------------------------
-- Table structure for features
-- ----------------------------
DROP TABLE IF EXISTS `features`;
CREATE TABLE `features`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `position` mediumint(9) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of features
-- ----------------------------
INSERT INTO `features` VALUES (1, 'test', '2021-03-14 09:16:13', '2021-03-14 09:16:13', NULL);

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_items_menu_id_foreign`(`menu_id`) USING BTREE,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-03-14 08:26:21', '2021-03-14 08:26:21', 'voyager.dashboard', NULL);
INSERT INTO `menu_items` VALUES (2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-03-14 08:26:21', '2021-03-14 08:26:21', 'voyager.media.index', NULL);
INSERT INTO `menu_items` VALUES (3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-03-14 08:26:21', '2021-03-14 08:26:21', 'voyager.users.index', NULL);
INSERT INTO `menu_items` VALUES (4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-03-14 08:26:21', '2021-03-14 08:26:21', 'voyager.roles.index', NULL);
INSERT INTO `menu_items` VALUES (5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-03-14 08:26:21', '2021-03-14 08:26:21', NULL, NULL);
INSERT INTO `menu_items` VALUES (6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-03-14 08:26:21', '2021-03-14 08:26:21', 'voyager.menus.index', NULL);
INSERT INTO `menu_items` VALUES (7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-03-14 08:26:21', '2021-03-14 08:26:21', 'voyager.database.index', NULL);
INSERT INTO `menu_items` VALUES (8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-03-14 08:26:21', '2021-03-14 08:26:21', 'voyager.compass.index', NULL);
INSERT INTO `menu_items` VALUES (9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-03-14 08:26:21', '2021-03-14 08:26:21', 'voyager.bread.index', NULL);
INSERT INTO `menu_items` VALUES (10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-03-14 08:26:21', '2021-03-14 08:26:21', 'voyager.settings.index', NULL);
INSERT INTO `menu_items` VALUES (11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-03-14 08:26:22', '2021-03-14 08:26:22', 'voyager.categories.index', NULL);
INSERT INTO `menu_items` VALUES (12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-03-14 08:26:22', '2021-03-14 08:26:22', 'voyager.posts.index', NULL);
INSERT INTO `menu_items` VALUES (13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-03-14 08:26:22', '2021-03-14 08:26:22', 'voyager.pages.index', NULL);
INSERT INTO `menu_items` VALUES (14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-03-14 08:26:23', '2021-03-14 08:26:23', 'voyager.hooks', NULL);
INSERT INTO `menu_items` VALUES (15, 1, 'Features', '', '_self', 'voyager-params', NULL, NULL, 15, '2021-03-14 08:49:15', '2021-03-14 08:49:15', 'voyager.features.index', NULL);
INSERT INTO `menu_items` VALUES (16, 1, 'Feature Options', '', '_self', 'voyager-list', NULL, NULL, 16, '2021-03-14 08:59:13', '2021-03-14 08:59:13', 'voyager.feature-options.index', NULL);
INSERT INTO `menu_items` VALUES (17, 1, 'Products', '', '_self', 'voyager-basket', NULL, NULL, 17, '2021-03-14 09:46:34', '2021-03-14 09:46:34', 'voyager.products.index', NULL);
INSERT INTO `menu_items` VALUES (18, 1, 'Socials', '', '_self', 'voyager-world', NULL, NULL, 18, '2021-03-27 07:40:08', '2021-03-27 07:40:08', 'voyager.socials.index', NULL);
INSERT INTO `menu_items` VALUES (19, 1, 'Banners', '', '_self', 'voyager-images', NULL, NULL, 19, '2021-03-27 07:46:36', '2021-03-27 07:46:36', 'voyager.banners.index', NULL);
INSERT INTO `menu_items` VALUES (20, 2, 'محصولات', '', '_self', NULL, '#000000', NULL, 1, '2021-03-27 12:04:01', '2021-03-27 12:04:45', NULL, '');
INSERT INTO `menu_items` VALUES (21, 2, 'ماهی', '', '_self', NULL, '#000000', 20, 1, '2021-03-27 12:04:41', '2021-03-27 12:04:45', NULL, '');
INSERT INTO `menu_items` VALUES (23, 2, 'درباره ما', '', '_self', NULL, '#000000', NULL, 2, '2021-03-27 12:05:55', '2021-03-27 12:06:28', NULL, '');
INSERT INTO `menu_items` VALUES (24, 2, 'درباره ما', '', '_self', NULL, '#000000', 23, 1, '2021-03-27 12:06:24', '2021-03-27 12:06:30', NULL, '');
INSERT INTO `menu_items` VALUES (25, 2, 'تماس با ما', '', '_self', NULL, '#000000', 23, 2, '2021-03-27 12:06:53', '2021-03-27 12:07:04', NULL, '');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menus_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'admin', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `menus` VALUES (2, 'header', '2021-03-27 12:02:33', '2021-03-27 12:02:33');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_01_000000_add_voyager_user_fields', 1);
INSERT INTO `migrations` VALUES (4, '2016_01_01_000000_create_data_types_table', 1);
INSERT INTO `migrations` VALUES (5, '2016_01_01_000000_create_pages_table', 1);
INSERT INTO `migrations` VALUES (6, '2016_01_01_000000_create_posts_table', 1);
INSERT INTO `migrations` VALUES (7, '2016_02_15_204651_create_categories_table', 1);
INSERT INTO `migrations` VALUES (8, '2016_05_19_173453_create_menu_table', 1);
INSERT INTO `migrations` VALUES (9, '2016_10_21_190000_create_roles_table', 1);
INSERT INTO `migrations` VALUES (10, '2016_10_21_190000_create_settings_table', 1);
INSERT INTO `migrations` VALUES (11, '2016_11_30_135954_create_permission_table', 1);
INSERT INTO `migrations` VALUES (12, '2016_11_30_141208_create_permission_role_table', 1);
INSERT INTO `migrations` VALUES (13, '2016_12_26_201236_data_types__add__server_side', 1);
INSERT INTO `migrations` VALUES (14, '2017_01_13_000000_add_route_to_menu_items_table', 1);
INSERT INTO `migrations` VALUES (15, '2017_01_14_005015_create_translations_table', 1);
INSERT INTO `migrations` VALUES (16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1);
INSERT INTO `migrations` VALUES (17, '2017_03_06_000000_add_controller_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_04_11_000000_alter_post_nullable_fields_table', 1);
INSERT INTO `migrations` VALUES (19, '2017_04_21_000000_add_order_to_data_rows_table', 1);
INSERT INTO `migrations` VALUES (20, '2017_07_05_210000_add_policyname_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (21, '2017_08_05_000000_add_group_to_settings_table', 1);
INSERT INTO `migrations` VALUES (22, '2017_11_26_013050_add_user_role_relationship', 1);
INSERT INTO `migrations` VALUES (23, '2017_11_26_015000_create_user_roles_table', 1);
INSERT INTO `migrations` VALUES (24, '2018_03_11_000000_add_user_settings', 1);
INSERT INTO `migrations` VALUES (25, '2018_03_14_000000_add_details_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (26, '2018_03_16_000000_make_settings_value_nullable', 1);
INSERT INTO `migrations` VALUES (27, '2019_08_19_000000_create_failed_jobs_table', 1);

-- ----------------------------
-- Table structure for option_product
-- ----------------------------
DROP TABLE IF EXISTS `option_product`;
CREATE TABLE `option_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `feature_option_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pages_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-03-14 08:26:22', '2021-03-14 08:26:22');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_permission_id_index`(`permission_id`) USING BTREE,
  INDEX `permission_role_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (2, 1);
INSERT INTO `permission_role` VALUES (3, 1);
INSERT INTO `permission_role` VALUES (4, 1);
INSERT INTO `permission_role` VALUES (5, 1);
INSERT INTO `permission_role` VALUES (6, 1);
INSERT INTO `permission_role` VALUES (7, 1);
INSERT INTO `permission_role` VALUES (8, 1);
INSERT INTO `permission_role` VALUES (9, 1);
INSERT INTO `permission_role` VALUES (10, 1);
INSERT INTO `permission_role` VALUES (11, 1);
INSERT INTO `permission_role` VALUES (12, 1);
INSERT INTO `permission_role` VALUES (13, 1);
INSERT INTO `permission_role` VALUES (14, 1);
INSERT INTO `permission_role` VALUES (15, 1);
INSERT INTO `permission_role` VALUES (16, 1);
INSERT INTO `permission_role` VALUES (17, 1);
INSERT INTO `permission_role` VALUES (18, 1);
INSERT INTO `permission_role` VALUES (19, 1);
INSERT INTO `permission_role` VALUES (20, 1);
INSERT INTO `permission_role` VALUES (21, 1);
INSERT INTO `permission_role` VALUES (22, 1);
INSERT INTO `permission_role` VALUES (23, 1);
INSERT INTO `permission_role` VALUES (24, 1);
INSERT INTO `permission_role` VALUES (25, 1);
INSERT INTO `permission_role` VALUES (26, 1);
INSERT INTO `permission_role` VALUES (27, 1);
INSERT INTO `permission_role` VALUES (28, 1);
INSERT INTO `permission_role` VALUES (29, 1);
INSERT INTO `permission_role` VALUES (30, 1);
INSERT INTO `permission_role` VALUES (31, 1);
INSERT INTO `permission_role` VALUES (32, 1);
INSERT INTO `permission_role` VALUES (33, 1);
INSERT INTO `permission_role` VALUES (34, 1);
INSERT INTO `permission_role` VALUES (35, 1);
INSERT INTO `permission_role` VALUES (36, 1);
INSERT INTO `permission_role` VALUES (37, 1);
INSERT INTO `permission_role` VALUES (38, 1);
INSERT INTO `permission_role` VALUES (39, 1);
INSERT INTO `permission_role` VALUES (40, 1);
INSERT INTO `permission_role` VALUES (42, 1);
INSERT INTO `permission_role` VALUES (43, 1);
INSERT INTO `permission_role` VALUES (44, 1);
INSERT INTO `permission_role` VALUES (45, 1);
INSERT INTO `permission_role` VALUES (46, 1);
INSERT INTO `permission_role` VALUES (47, 1);
INSERT INTO `permission_role` VALUES (48, 1);
INSERT INTO `permission_role` VALUES (49, 1);
INSERT INTO `permission_role` VALUES (50, 1);
INSERT INTO `permission_role` VALUES (51, 1);
INSERT INTO `permission_role` VALUES (52, 1);
INSERT INTO `permission_role` VALUES (53, 1);
INSERT INTO `permission_role` VALUES (54, 1);
INSERT INTO `permission_role` VALUES (55, 1);
INSERT INTO `permission_role` VALUES (56, 1);
INSERT INTO `permission_role` VALUES (57, 1);
INSERT INTO `permission_role` VALUES (58, 1);
INSERT INTO `permission_role` VALUES (59, 1);
INSERT INTO `permission_role` VALUES (60, 1);
INSERT INTO `permission_role` VALUES (61, 1);
INSERT INTO `permission_role` VALUES (62, 1);
INSERT INTO `permission_role` VALUES (63, 1);
INSERT INTO `permission_role` VALUES (64, 1);
INSERT INTO `permission_role` VALUES (65, 1);
INSERT INTO `permission_role` VALUES (66, 1);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permissions_key_index`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'browse_admin', NULL, '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (2, 'browse_bread', NULL, '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (3, 'browse_database', NULL, '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (4, 'browse_media', NULL, '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (5, 'browse_compass', NULL, '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (6, 'browse_menus', 'menus', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (7, 'read_menus', 'menus', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (8, 'edit_menus', 'menus', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (9, 'add_menus', 'menus', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (10, 'delete_menus', 'menus', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (11, 'browse_roles', 'roles', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (12, 'read_roles', 'roles', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (13, 'edit_roles', 'roles', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (14, 'add_roles', 'roles', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (15, 'delete_roles', 'roles', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (16, 'browse_users', 'users', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (17, 'read_users', 'users', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (18, 'edit_users', 'users', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (19, 'add_users', 'users', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (20, 'delete_users', 'users', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (21, 'browse_settings', 'settings', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (22, 'read_settings', 'settings', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (23, 'edit_settings', 'settings', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (24, 'add_settings', 'settings', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (25, 'delete_settings', 'settings', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `permissions` VALUES (26, 'browse_categories', 'categories', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (27, 'read_categories', 'categories', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (28, 'edit_categories', 'categories', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (29, 'add_categories', 'categories', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (30, 'delete_categories', 'categories', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (31, 'browse_posts', 'posts', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (32, 'read_posts', 'posts', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (33, 'edit_posts', 'posts', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (34, 'add_posts', 'posts', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (35, 'delete_posts', 'posts', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (36, 'browse_pages', 'pages', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (37, 'read_pages', 'pages', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (38, 'edit_pages', 'pages', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (39, 'add_pages', 'pages', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (40, 'delete_pages', 'pages', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `permissions` VALUES (41, 'browse_hooks', NULL, '2021-03-14 08:26:23', '2021-03-14 08:26:23');
INSERT INTO `permissions` VALUES (42, 'browse_features', 'features', '2021-03-14 08:49:15', '2021-03-14 08:49:15');
INSERT INTO `permissions` VALUES (43, 'read_features', 'features', '2021-03-14 08:49:15', '2021-03-14 08:49:15');
INSERT INTO `permissions` VALUES (44, 'edit_features', 'features', '2021-03-14 08:49:15', '2021-03-14 08:49:15');
INSERT INTO `permissions` VALUES (45, 'add_features', 'features', '2021-03-14 08:49:15', '2021-03-14 08:49:15');
INSERT INTO `permissions` VALUES (46, 'delete_features', 'features', '2021-03-14 08:49:15', '2021-03-14 08:49:15');
INSERT INTO `permissions` VALUES (47, 'browse_feature_options', 'feature_options', '2021-03-14 08:59:13', '2021-03-14 08:59:13');
INSERT INTO `permissions` VALUES (48, 'read_feature_options', 'feature_options', '2021-03-14 08:59:13', '2021-03-14 08:59:13');
INSERT INTO `permissions` VALUES (49, 'edit_feature_options', 'feature_options', '2021-03-14 08:59:13', '2021-03-14 08:59:13');
INSERT INTO `permissions` VALUES (50, 'add_feature_options', 'feature_options', '2021-03-14 08:59:13', '2021-03-14 08:59:13');
INSERT INTO `permissions` VALUES (51, 'delete_feature_options', 'feature_options', '2021-03-14 08:59:13', '2021-03-14 08:59:13');
INSERT INTO `permissions` VALUES (52, 'browse_products', 'products', '2021-03-14 09:46:34', '2021-03-14 09:46:34');
INSERT INTO `permissions` VALUES (53, 'read_products', 'products', '2021-03-14 09:46:34', '2021-03-14 09:46:34');
INSERT INTO `permissions` VALUES (54, 'edit_products', 'products', '2021-03-14 09:46:34', '2021-03-14 09:46:34');
INSERT INTO `permissions` VALUES (55, 'add_products', 'products', '2021-03-14 09:46:34', '2021-03-14 09:46:34');
INSERT INTO `permissions` VALUES (56, 'delete_products', 'products', '2021-03-14 09:46:34', '2021-03-14 09:46:34');
INSERT INTO `permissions` VALUES (57, 'browse_socials', 'socials', '2021-03-27 07:40:08', '2021-03-27 07:40:08');
INSERT INTO `permissions` VALUES (58, 'read_socials', 'socials', '2021-03-27 07:40:08', '2021-03-27 07:40:08');
INSERT INTO `permissions` VALUES (59, 'edit_socials', 'socials', '2021-03-27 07:40:08', '2021-03-27 07:40:08');
INSERT INTO `permissions` VALUES (60, 'add_socials', 'socials', '2021-03-27 07:40:08', '2021-03-27 07:40:08');
INSERT INTO `permissions` VALUES (61, 'delete_socials', 'socials', '2021-03-27 07:40:08', '2021-03-27 07:40:08');
INSERT INTO `permissions` VALUES (62, 'browse_banners', 'banners', '2021-03-27 07:46:36', '2021-03-27 07:46:36');
INSERT INTO `permissions` VALUES (63, 'read_banners', 'banners', '2021-03-27 07:46:36', '2021-03-27 07:46:36');
INSERT INTO `permissions` VALUES (64, 'edit_banners', 'banners', '2021-03-27 07:46:36', '2021-03-27 07:46:36');
INSERT INTO `permissions` VALUES (65, 'add_banners', 'banners', '2021-03-27 07:46:36', '2021-03-27 07:46:36');
INSERT INTO `permissions` VALUES (66, 'delete_banners', 'banners', '2021-03-27 07:46:36', '2021-03-27 07:46:36');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `posts_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `posts` VALUES (2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `posts` VALUES (3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `posts` VALUES (4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-14 08:26:22', '2021-03-14 08:26:22');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scientific_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `photos` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `nutrition_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `is_featured` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `products_category_id_index`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', '2021-03-14 08:26:21', '2021-03-14 08:26:21');
INSERT INTO `roles` VALUES (2, 'user', 'Normal User', '2021-03-14 08:26:21', '2021-03-14 08:26:21');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site');
INSERT INTO `settings` VALUES (2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site');
INSERT INTO `settings` VALUES (3, 'site.logo', 'Site Logo', 'settings\\March2021\\B6cjmMLmk9c3hWfVuhHa.png', '', 'image', 3, 'Site');
INSERT INTO `settings` VALUES (4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site');
INSERT INTO `settings` VALUES (5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin');
INSERT INTO `settings` VALUES (6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin');
INSERT INTO `settings` VALUES (7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin');
INSERT INTO `settings` VALUES (8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin');
INSERT INTO `settings` VALUES (9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin');
INSERT INTO `settings` VALUES (10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- ----------------------------
-- Table structure for socials
-- ----------------------------
DROP TABLE IF EXISTS `socials`;
CREATE TABLE `socials`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) UNSIGNED NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `translations_table_name_column_name_foreign_key_locale_unique`(`table_name`, `column_name`, `foreign_key`, `locale`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of translations
-- ----------------------------
INSERT INTO `translations` VALUES (1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-03-14 08:26:22', '2021-03-14 08:26:22');
INSERT INTO `translations` VALUES (23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-03-14 08:26:23', '2021-03-14 08:26:23');
INSERT INTO `translations` VALUES (24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-03-14 08:26:23', '2021-03-14 08:26:23');
INSERT INTO `translations` VALUES (25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-03-14 08:26:23', '2021-03-14 08:26:23');
INSERT INTO `translations` VALUES (26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-03-14 08:26:23', '2021-03-14 08:26:23');
INSERT INTO `translations` VALUES (27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-03-14 08:26:23', '2021-03-14 08:26:23');
INSERT INTO `translations` VALUES (28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-03-14 08:26:23', '2021-03-14 08:26:23');
INSERT INTO `translations` VALUES (29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-03-14 08:26:23', '2021-03-14 08:26:23');
INSERT INTO `translations` VALUES (30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-03-14 08:26:23', '2021-03-14 08:26:23');
INSERT INTO `translations` VALUES (31, 'data_rows', 'display_name', 60, 'fa', 'Id', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (32, 'data_rows', 'display_name', 60, 'tr', 'Id', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (33, 'data_rows', 'display_name', 60, 'ru', 'Id', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (34, 'data_rows', 'display_name', 61, 'fa', 'Value', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (35, 'data_rows', 'display_name', 61, 'tr', 'Value', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (36, 'data_rows', 'display_name', 61, 'ru', 'Value', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (37, 'data_rows', 'display_name', 62, 'fa', 'Created At', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (38, 'data_rows', 'display_name', 62, 'tr', 'Created At', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (39, 'data_rows', 'display_name', 62, 'ru', 'Created At', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (40, 'data_rows', 'display_name', 63, 'fa', 'Updated At', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (41, 'data_rows', 'display_name', 63, 'tr', 'Updated At', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (42, 'data_rows', 'display_name', 63, 'ru', 'Updated At', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (43, 'data_types', 'display_name_singular', 9, 'fa', 'Feature Option', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (44, 'data_types', 'display_name_singular', 9, 'tr', 'Feature Option', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (45, 'data_types', 'display_name_singular', 9, 'ru', 'Feature Option', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (46, 'data_types', 'display_name_plural', 9, 'fa', 'Feature Options', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (47, 'data_types', 'display_name_plural', 9, 'tr', 'Feature Options', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (48, 'data_types', 'display_name_plural', 9, 'ru', 'Feature Options', '2021-03-14 09:14:08', '2021-03-14 09:14:08');
INSERT INTO `translations` VALUES (49, 'data_rows', 'display_name', 64, 'fa', 'Feature Id', '2021-03-14 09:16:02', '2021-03-14 09:16:02');
INSERT INTO `translations` VALUES (50, 'data_rows', 'display_name', 64, 'tr', 'Feature Id', '2021-03-14 09:16:02', '2021-03-14 09:16:02');
INSERT INTO `translations` VALUES (51, 'data_rows', 'display_name', 64, 'ru', 'Feature Id', '2021-03-14 09:16:02', '2021-03-14 09:16:02');
INSERT INTO `translations` VALUES (52, 'data_rows', 'display_name', 65, 'fa', 'features', '2021-03-14 09:16:02', '2021-03-14 09:16:02');
INSERT INTO `translations` VALUES (53, 'data_rows', 'display_name', 65, 'tr', 'features', '2021-03-14 09:16:02', '2021-03-14 09:16:02');
INSERT INTO `translations` VALUES (54, 'data_rows', 'display_name', 65, 'ru', 'features', '2021-03-14 09:16:02', '2021-03-14 09:16:02');
INSERT INTO `translations` VALUES (55, 'feature_options', 'value', 1, 'fa', 'test option', '2021-03-14 09:19:34', '2021-03-14 09:19:34');
INSERT INTO `translations` VALUES (56, 'feature_options', 'value', 1, 'tr', 'test option', '2021-03-14 09:19:34', '2021-03-14 09:19:34');
INSERT INTO `translations` VALUES (57, 'feature_options', 'value', 1, 'ru', 'test option', '2021-03-14 09:19:34', '2021-03-14 09:19:34');
INSERT INTO `translations` VALUES (58, 'data_rows', 'display_name', 66, 'en', 'Id', '2021-03-14 09:47:51', '2021-03-14 09:47:51');
INSERT INTO `translations` VALUES (59, 'data_rows', 'display_name', 67, 'en', 'Name', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (60, 'data_rows', 'display_name', 68, 'en', 'Scientific Name', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (61, 'data_rows', 'display_name', 69, 'en', 'Description', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (62, 'data_rows', 'display_name', 70, 'en', 'Photos', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (63, 'data_rows', 'display_name', 71, 'en', 'Nutrition Photo', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (64, 'data_rows', 'display_name', 72, 'en', 'Category Id', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (65, 'data_rows', 'display_name', 73, 'en', 'Created At', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (66, 'data_rows', 'display_name', 74, 'en', 'Updated At', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (67, 'data_rows', 'display_name', 75, 'en', 'Deleted At', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (68, 'data_rows', 'display_name', 76, 'en', 'categories', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (69, 'data_types', 'display_name_singular', 11, 'en', 'Product', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (70, 'data_types', 'display_name_plural', 11, 'en', 'Products', '2021-03-14 09:47:52', '2021-03-14 09:47:52');
INSERT INTO `translations` VALUES (71, 'data_rows', 'display_name', 66, 'tr', 'Id', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (72, 'data_rows', 'display_name', 66, 'ru', 'Id', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (73, 'data_rows', 'display_name', 67, 'tr', 'Name', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (74, 'data_rows', 'display_name', 67, 'ru', 'Name', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (75, 'data_rows', 'display_name', 68, 'tr', 'Scientific Name', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (76, 'data_rows', 'display_name', 68, 'ru', 'Scientific Name', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (77, 'data_rows', 'display_name', 69, 'tr', 'Description', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (78, 'data_rows', 'display_name', 69, 'ru', 'Description', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (79, 'data_rows', 'display_name', 70, 'tr', 'Photos', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (80, 'data_rows', 'display_name', 70, 'ru', 'Photos', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (81, 'data_rows', 'display_name', 71, 'tr', 'Nutrition Photo', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (82, 'data_rows', 'display_name', 71, 'ru', 'Nutrition Photo', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (83, 'data_rows', 'display_name', 72, 'tr', 'Category Id', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (84, 'data_rows', 'display_name', 72, 'ru', 'Category Id', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (85, 'data_rows', 'display_name', 73, 'tr', 'Created At', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (86, 'data_rows', 'display_name', 73, 'ru', 'Created At', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (87, 'data_rows', 'display_name', 74, 'tr', 'Updated At', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (88, 'data_rows', 'display_name', 74, 'ru', 'Updated At', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (89, 'data_rows', 'display_name', 75, 'tr', 'Deleted At', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (90, 'data_rows', 'display_name', 75, 'ru', 'Deleted At', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (91, 'data_rows', 'display_name', 76, 'tr', 'categories', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (92, 'data_rows', 'display_name', 76, 'ru', 'categories', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (93, 'data_types', 'display_name_singular', 11, 'tr', 'Product', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (94, 'data_types', 'display_name_singular', 11, 'ru', 'Product', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (95, 'data_types', 'display_name_plural', 11, 'tr', 'Products', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (96, 'data_types', 'display_name_plural', 11, 'ru', 'Products', '2021-03-14 09:49:08', '2021-03-14 09:49:08');
INSERT INTO `translations` VALUES (97, 'data_rows', 'display_name', 77, 'en', 'feature_options', '2021-03-14 09:50:24', '2021-03-14 09:50:24');
INSERT INTO `translations` VALUES (98, 'data_rows', 'display_name', 77, 'tr', 'feature_options', '2021-03-14 09:50:37', '2021-03-14 09:50:37');
INSERT INTO `translations` VALUES (99, 'data_rows', 'display_name', 77, 'ru', 'feature_options', '2021-03-14 09:50:37', '2021-03-14 09:50:37');
INSERT INTO `translations` VALUES (100, 'data_rows', 'display_name', 56, 'en', 'Id', '2021-03-14 10:21:01', '2021-03-14 10:21:01');
INSERT INTO `translations` VALUES (101, 'data_rows', 'display_name', 57, 'en', 'Title', '2021-03-14 10:21:01', '2021-03-14 10:21:01');
INSERT INTO `translations` VALUES (102, 'data_rows', 'display_name', 58, 'en', 'Created At', '2021-03-14 10:21:01', '2021-03-14 10:21:01');
INSERT INTO `translations` VALUES (103, 'data_rows', 'display_name', 59, 'en', 'Updated At', '2021-03-14 10:21:01', '2021-03-14 10:21:01');
INSERT INTO `translations` VALUES (104, 'data_rows', 'display_name', 78, 'en', 'feature_options', '2021-03-14 10:21:01', '2021-03-14 10:21:01');
INSERT INTO `translations` VALUES (105, 'data_types', 'display_name_singular', 7, 'en', 'Feature', '2021-03-14 10:21:01', '2021-03-14 10:21:01');
INSERT INTO `translations` VALUES (106, 'data_types', 'display_name_plural', 7, 'en', 'Features', '2021-03-14 10:21:01', '2021-03-14 10:21:01');
INSERT INTO `translations` VALUES (107, 'data_rows', 'display_name', 56, 'tr', 'Id', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (108, 'data_rows', 'display_name', 56, 'ru', 'Id', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (109, 'data_rows', 'display_name', 57, 'tr', 'Title', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (110, 'data_rows', 'display_name', 57, 'ru', 'Title', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (111, 'data_rows', 'display_name', 58, 'tr', 'Created At', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (112, 'data_rows', 'display_name', 58, 'ru', 'Created At', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (113, 'data_rows', 'display_name', 59, 'tr', 'Updated At', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (114, 'data_rows', 'display_name', 59, 'ru', 'Updated At', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (115, 'data_rows', 'display_name', 78, 'tr', 'feature_options', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (116, 'data_rows', 'display_name', 78, 'ru', 'feature_options', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (117, 'data_types', 'display_name_singular', 7, 'tr', 'Feature', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (118, 'data_types', 'display_name_singular', 7, 'ru', 'Feature', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (119, 'data_types', 'display_name_plural', 7, 'tr', 'Features', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (120, 'data_types', 'display_name_plural', 7, 'ru', 'Features', '2021-03-14 10:21:55', '2021-03-14 10:21:55');
INSERT INTO `translations` VALUES (121, 'data_rows', 'display_name', 80, 'en', 'Id', '2021-03-27 07:47:10', '2021-03-27 07:47:10');
INSERT INTO `translations` VALUES (122, 'data_rows', 'display_name', 81, 'en', 'Title', '2021-03-27 07:47:10', '2021-03-27 07:47:10');
INSERT INTO `translations` VALUES (123, 'data_rows', 'display_name', 82, 'en', 'Link', '2021-03-27 07:47:10', '2021-03-27 07:47:10');
INSERT INTO `translations` VALUES (124, 'data_rows', 'display_name', 83, 'en', 'Position', '2021-03-27 07:47:10', '2021-03-27 07:47:10');
INSERT INTO `translations` VALUES (125, 'data_rows', 'display_name', 84, 'en', 'Created At', '2021-03-27 07:47:10', '2021-03-27 07:47:10');
INSERT INTO `translations` VALUES (126, 'data_rows', 'display_name', 85, 'en', 'Updated At', '2021-03-27 07:47:10', '2021-03-27 07:47:10');
INSERT INTO `translations` VALUES (127, 'data_types', 'display_name_singular', 12, 'en', 'Social', '2021-03-27 07:47:10', '2021-03-27 07:47:10');
INSERT INTO `translations` VALUES (128, 'data_types', 'display_name_plural', 12, 'en', 'Socials', '2021-03-27 07:47:10', '2021-03-27 07:47:10');
INSERT INTO `translations` VALUES (129, 'data_rows', 'display_name', 86, 'en', 'Id', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (130, 'data_rows', 'display_name', 87, 'en', 'Title', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (131, 'data_rows', 'display_name', 88, 'en', 'Subtitle', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (132, 'data_rows', 'display_name', 89, 'en', 'Url', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (133, 'data_rows', 'display_name', 90, 'en', 'Photo', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (134, 'data_rows', 'display_name', 91, 'en', 'Created At', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (135, 'data_rows', 'display_name', 92, 'en', 'Updated At', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (136, 'data_rows', 'display_name', 93, 'en', 'Position', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (137, 'data_types', 'display_name_singular', 13, 'en', 'Banner', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (138, 'data_types', 'display_name_plural', 13, 'en', 'Banners', '2021-03-27 07:47:22', '2021-03-27 07:47:22');
INSERT INTO `translations` VALUES (139, 'data_rows', 'display_name', 22, 'en', 'ID', '2021-03-27 07:54:01', '2021-03-27 07:54:01');
INSERT INTO `translations` VALUES (140, 'data_rows', 'display_name', 23, 'en', 'Parent', '2021-03-27 07:54:01', '2021-03-27 07:54:01');
INSERT INTO `translations` VALUES (141, 'data_rows', 'display_name', 24, 'en', 'Order', '2021-03-27 07:54:01', '2021-03-27 07:54:01');
INSERT INTO `translations` VALUES (142, 'data_rows', 'display_name', 25, 'en', 'Name', '2021-03-27 07:54:01', '2021-03-27 07:54:01');
INSERT INTO `translations` VALUES (143, 'data_rows', 'display_name', 26, 'en', 'Slug', '2021-03-27 07:54:01', '2021-03-27 07:54:01');
INSERT INTO `translations` VALUES (144, 'data_rows', 'display_name', 27, 'en', 'Created At', '2021-03-27 07:54:01', '2021-03-27 07:54:01');
INSERT INTO `translations` VALUES (145, 'data_rows', 'display_name', 28, 'en', 'Updated At', '2021-03-27 07:54:01', '2021-03-27 07:54:01');
INSERT INTO `translations` VALUES (146, 'data_types', 'display_name_singular', 4, 'en', 'Category', '2021-03-27 07:54:01', '2021-03-27 07:54:01');
INSERT INTO `translations` VALUES (147, 'data_types', 'display_name_plural', 4, 'en', 'Categories', '2021-03-27 07:54:01', '2021-03-27 07:54:01');
INSERT INTO `translations` VALUES (148, 'data_rows', 'display_name', 22, 'tr', 'ID', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (149, 'data_rows', 'display_name', 22, 'ru', 'ID', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (150, 'data_rows', 'display_name', 23, 'tr', 'Parent', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (151, 'data_rows', 'display_name', 23, 'ru', 'Parent', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (152, 'data_rows', 'display_name', 24, 'tr', 'Order', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (153, 'data_rows', 'display_name', 24, 'ru', 'Order', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (154, 'data_rows', 'display_name', 25, 'tr', 'Name', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (155, 'data_rows', 'display_name', 25, 'ru', 'Name', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (156, 'data_rows', 'display_name', 26, 'tr', 'Slug', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (157, 'data_rows', 'display_name', 26, 'ru', 'Slug', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (158, 'data_rows', 'display_name', 27, 'tr', 'Created At', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (159, 'data_rows', 'display_name', 27, 'ru', 'Created At', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (160, 'data_rows', 'display_name', 28, 'tr', 'Updated At', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (161, 'data_rows', 'display_name', 28, 'ru', 'Updated At', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (162, 'data_rows', 'display_name', 94, 'en', 'Position', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (163, 'data_types', 'display_name_singular', 4, 'tr', 'Category', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (164, 'data_types', 'display_name_singular', 4, 'ru', 'Category', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (165, 'data_types', 'display_name_plural', 4, 'tr', 'Categories', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (166, 'data_types', 'display_name_plural', 4, 'ru', 'Categories', '2021-03-27 07:54:42', '2021-03-27 07:54:42');
INSERT INTO `translations` VALUES (167, 'data_rows', 'display_name', 94, 'tr', 'Position', '2021-03-27 07:56:08', '2021-03-27 07:56:08');
INSERT INTO `translations` VALUES (168, 'data_rows', 'display_name', 94, 'ru', 'Position', '2021-03-27 07:56:08', '2021-03-27 07:56:08');
INSERT INTO `translations` VALUES (169, 'data_rows', 'display_name', 86, 'tr', 'Id', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (170, 'data_rows', 'display_name', 86, 'ru', 'Id', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (171, 'data_rows', 'display_name', 87, 'tr', 'Title', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (172, 'data_rows', 'display_name', 87, 'ru', 'Title', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (173, 'data_rows', 'display_name', 88, 'tr', 'Subtitle', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (174, 'data_rows', 'display_name', 88, 'ru', 'Subtitle', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (175, 'data_rows', 'display_name', 89, 'tr', 'Url', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (176, 'data_rows', 'display_name', 89, 'ru', 'Url', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (177, 'data_rows', 'display_name', 90, 'tr', 'Photo', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (178, 'data_rows', 'display_name', 90, 'ru', 'Photo', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (179, 'data_rows', 'display_name', 91, 'tr', 'Created At', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (180, 'data_rows', 'display_name', 91, 'ru', 'Created At', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (181, 'data_rows', 'display_name', 92, 'tr', 'Updated At', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (182, 'data_rows', 'display_name', 92, 'ru', 'Updated At', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (183, 'data_rows', 'display_name', 93, 'tr', 'Position', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (184, 'data_rows', 'display_name', 93, 'ru', 'Position', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (185, 'data_types', 'display_name_singular', 13, 'tr', 'Banner', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (186, 'data_types', 'display_name_singular', 13, 'ru', 'Banner', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (187, 'data_types', 'display_name_plural', 13, 'tr', 'Banners', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (188, 'data_types', 'display_name_plural', 13, 'ru', 'Banners', '2021-03-27 07:57:05', '2021-03-27 07:57:05');
INSERT INTO `translations` VALUES (189, 'menu_items', 'title', 20, 'en', 'Products', '2021-03-27 12:04:01', '2021-03-27 12:04:01');
INSERT INTO `translations` VALUES (190, 'menu_items', 'title', 21, 'en', 'fish', '2021-03-27 12:04:41', '2021-03-27 12:04:41');
INSERT INTO `translations` VALUES (192, 'menu_items', 'title', 23, 'en', 'about us', '2021-03-27 12:05:55', '2021-03-27 12:05:55');
INSERT INTO `translations` VALUES (193, 'menu_items', 'title', 24, 'en', 'who we are', '2021-03-27 12:06:24', '2021-03-27 12:06:24');
INSERT INTO `translations` VALUES (194, 'menu_items', 'title', 25, 'en', 'contact us', '2021-03-27 12:06:53', '2021-03-27 12:06:53');
INSERT INTO `translations` VALUES (195, 'banners', 'title', 1, 'en', 'Organic Fruit, Vegetables and Meat', '2021-03-27 20:25:04', '2021-03-27 20:25:04');
INSERT INTO `translations` VALUES (196, 'banners', 'subtitle', 1, 'en', 'shop now', '2021-03-27 20:25:04', '2021-03-27 20:25:04');
INSERT INTO `translations` VALUES (197, 'banners', 'title', 1, 'tr', 'Organic Fruit, Vegetables and Meat', '2021-03-27 20:26:13', '2021-03-27 20:26:13');
INSERT INTO `translations` VALUES (198, 'banners', 'title', 1, 'ru', 'Organic Fruit, Vegetables and Meat', '2021-03-27 20:26:13', '2021-03-27 20:26:13');
INSERT INTO `translations` VALUES (199, 'banners', 'subtitle', 1, 'tr', 'shop now', '2021-03-27 20:26:13', '2021-03-27 20:26:13');
INSERT INTO `translations` VALUES (200, 'banners', 'subtitle', 1, 'ru', 'shop now', '2021-03-27 20:26:13', '2021-03-27 20:26:13');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_roles_user_id_index`(`user_id`) USING BTREE,
  INDEX `user_roles_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'users/default.png',
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$aEca.j9o77cAUObaFd38cezrWse6qlYJYqLUpBxUnvbjYNvsY7MDm', '7QXguCvGNGiaMx8XI7AcJlL6TOpSLUnJ1zg6imxw63fNuKFlnNPTxEdJegmL', NULL, '2021-03-14 08:26:22', '2021-03-14 08:26:22');

SET FOREIGN_KEY_CHECKS = 1;
