-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2017 at 05:49 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taodb`
--
CREATE DATABASE IF NOT EXISTS `taodb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `taodb`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `user_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `clothes_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `quantity` tinyint(3) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `clothes_id`, `quantity`, `update_at`) VALUES
(00000000008, 00000000000, 00000000076, 1, '2017-04-10 02:41:56'),
(00000000023, 00000000007, 00000000001, 1, '2017-04-12 01:32:25'),
(00000000024, 00000000007, 00000000013, 1, '2017-04-12 01:32:27'),
(00000000026, 00000000001, 00000000074, 1, '2017-04-13 18:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `type_id` int(2) UNSIGNED ZEROFILL NOT NULL,
  `gender_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`, `price`, `type_id`, `gender_id`) VALUES
(00000000001, 'ASPESI GARMENT DYED FACE CREW SWEAT', 'Italian label Aspesi lend their garment dyed crew sweat a humorous touch with the addition of a face motif to the chest. The loopback jersey crew sweat is otherwise finished exactly as you would expect with ribbed cuffs, hem and crew neckline.', 1019, 02, 1),
(00000000002, 'ASPESI GARMENT DYED MA-1 JACKET', 'Providing a suitably sleek take on the MA-1 silhouette, Italian label Aspesi craft their rendition from a garment dyed nylon-blend. The minimalist design is styled with a ribbed knit collar, cuffs and hem, along with the classic zipped utility pocket to the left-hand sleeve. The versatility of the jacket"s design creates a piece that is at home worn atop a shirt as it will be a casual crew sweat.', 2999, 01, 1),
(00000000003, 'ADIDAS X WHITE MOUNTAINEERING LOGO TEE', 'adidas continue to build on the legacy of their progressive collaboration with Japanese outfit White Mountaineering, delivering a signature streetwear edge to a sporting design. The Logo Tee presents a wardrobe basic with a sporting aesthetic, crafted from a cotton-blend with a ribbed crew neck, dual branding throughout and finished with a curved hem.', 475, 03, 1),
(00000000025, 'NEIGHBORHOOD M-65 JACKET', 'One of the most coveted brands to have ever come out of the Japanese market Neighborhood present a most ubiquitous military issue garment, the M-65 Jacket. Featuring a number of ‘MIL-SPEC’ details this jacket also features contemporary updates seen in a removable pin badge and large rear ''WHO DARES WINS'' print inspired by the British special forces motto ''He who dares, wins''.\r\n</br></br>\r\n100% High Density Cotton</br>\r\nFour Front Snap Pockets</br>\r\nRear Print\r\nRemovable Pin Badge\r\nEpaulets\r\nAdjustable Drawstring Hem and Waist\r\nZip Closure with Button Storm Flap\r\nMade in Japan', 5579, 01, 1),
(00000000026, 'NEIGHBORHOOD BASEBALL JACKET', 'One of the most coveted brands to have ever come out of the Japanese market Neighborhood present their take on the Baseball Jacket, with this high shine iteration. Cut from a lustrous, smooth polyester, it features a quilted interior and contrasting, branded prints to the chest, back and sleeves, which are inspired by a US Marine''s motto. Branded snap buttons, hand warmer pockets and sporting ribbed cuffs, collar and hem finish this piece.\r\n</br></br>\r\n100% Polyester</br>\r\nPrinted Decorations</br>\r\nBranded Snap Fastenings</br>\r\nRibbed Collar, Cuffs & Hem</br>\r\nSlanted Hand Pockets</br>\r\nMade in Japan</br>', 2609, 01, 1),
(00000000027, 'NEIGHBORHOOD CLASSIC HOODY', 'A fine example of their design ethos, Neighborhood continue to craft with pride - “where craftsmanship is highly respected with complete formality". This hoody takes inspiration from America’s traditional collegiate styling with its classic silhouette and cosy fleece inner.\r\n</br></br>\r\n100% Cotton</br>\r\nFleeced Inner</br>\r\nKangaroo Pouch Pocket</br>\r\nRibbed Cuffs</br>\r\nLogo Patch to Hem</br>\r\nMade in Japan', 2085, 02, 1),
(00000000028, 'A BATHING APE COLLEGE CREW SWEAT', 'Relax in signature style with this sweatshirt from Japanese-label A BATHING APE®. Punctuated with streetwear styling in the signature BAPE HEAD chest print, the soft cotton jersey is finished with all the classic detailing for a downtime essential.\r\n</br></br>\r\n100% Cotton</br>\r\nBAPE HEAD Chest Print</br>\r\nSleeve Logo Patch</br>\r\nRibbed Crew, Cuffs & Hem</br>\r\nStyle Code: 1C80113015-GY', 1989, 02, 1),
(00000000029, 'PUMA X TRAPSTAR TRACK TEE', 'The PUMA x Trapstar collaboration continues for SS17 with a range of footwear and apparel. The collection’s apparel includes all of the essentials infused with Trapstar’s underground sub-cultural influences, creating stand out pieces through reinventing classics.\r\n</br></br>\r\nRemixing iconic street wear silhouettes, the collection has an authentic Trapstar feel. Cut from a soft cotton jersey, the Puma x Trapstar Track Tee features the two brands logos the chest and back, which are finished with reflective details.\r\n</br></br>\r\n100% Cotton</br>\r\nReflective Logo Decoration to the Front & Back</br>\r\nCrew Neckline</br>\r\nStyle Code: 572577', 379, 03, 1),
(00000000030, 'Nigel Cabourn x Lybro CPO Shirt', 'Breathing new life into the Lybro brand, Nigel Cabourn introduces the CPO shirt into his range of hardwearing, vintage-inspired work wear clothes. Delivering the style of those worn on the deck in the US Navy, this traditional overshirt is an authentic reinterpretation of the original – adopted into everyday wear as either a jacket or layering piece.<br/><br/>\r\n•100% Cotton<br/>\r\n•Chambray Fabric<br/>\r\n•Elbow Patches<br/>\r\n•Metal Button Closure<br/>\r\n•Chest Pockets<br/>\r\n', 2085, 04, 1),
(00000000031, 'MHL. By Margaret Howell Basic Shirt', 'Established by iconic British designer Margaret Howell, MHL explores the tailoring, structure and functionality inherent in menswear design.<br/><br/>\r\n\r\nThe garment washed Basic Shirt features a single chevron patch pocket to the chest and a small hanger loop to the back yoke. Button down fastenings are utilised throughout and a button-tap is present on the sleeves, allowing them to be adjusted in warmer weather, making this the perfect transitional piece this season.<br/><br/>\r\n•100% Cotton<br/>\r\n•Button Down Fastenings<br/>\r\n•Classic Collar<br/>\r\n•Patch Pocket\r\n', 1390, 04, 1),
(00000000032, 'Superdry Leather Jacket', '', 1740, 05, 2),
(00000000033, 'CeCe ''Ella'' Faux Fur Trim Wool Blend Duffle Coat', 'A plush faux fur ruff and gleaming hardware elevate the look of a hearty wool-blend duffle equipped with a detachable hood for styling versatility and practical weather protection.</br></br>\r\n30" length (size 4)</br>\r\nHidden front zip/snap closure; two toggle-clasp closures</br>\r\nStand collar with detachable hood</br>\r\nLong sleeves</br>\r\nFront welt and snap-flap patch pockets</br>\r\nBack vent</br>\r\nFully lined</br>\r\n60% wool, 30% polyester, 5% viscose, 5% other fibers</br>\r\nDry clean</br>\r\nImported</br>\r\nCoats', 834, 05, 2),
(00000000034, 'G-Star RAW Knitted Sweater', '', 548, 06, 2),
(00000000036, 'Halogen Scalloped Lace Pencil Skirt', 'Pretty eyelet lace with a scalloped border makes this slim skirt a winner for the office or after hours.</br></br>\r\n26 1/2" regular length (size 8); 26" petite length (size 8P)</br>\r\nHidden back-zip closure</br>\r\nLined</br>\r\n100% cotton</br>\r\nDry clean</br>\r\nImported</br>\r\nPoint of View and Petite Focus</br>\r\nRegular Item #5255137, Petite Item #5258208</br>', 659, 08, 2),
(00000000037, 'ELIZA J Floral Appliqué Ball Skirt', 'Shimmery embroidery and petal appliqués trace floral designs that pop on this A-line skirt with surreal dimension. A banded waist and kick pleats shape and define the silhouette for a flattering fit.</br></br>\r\n-26" length (size 8)</br>\r\n-Back zip closure</br>\r\n-Side-seam pockets</br>\r\n-Fully lined</br>\r\n-100% polyester with 96% polyester, 4% spandex</br>\r\n-Dry clean or hand wash cold, dry flat</br>\r\n-By Eliza J; imported</br>\r\n-Special Occasion', 1403, 08, 2),
(00000000039, 'A-IN GIRLS Fashion Denim Jacket', 'The latest Korean fashion hot selection<br/>\r\n- Korean fashion, smart choice<br/>\r\n- easy to match, fashion up to people<br/>\r\n- hot new, to the tide to IN<br/>\r\n- The product is manufactured differently depending on the supplier', 498, 05, 2),
(00000000040, 'COLDWEAR Slim Fit Down Jacket Lined With Sherpa Fleece', 'Sometimes a light jacket just is not enough to protect us from the cold. Designed by COLDWEAR, this ribbed item boasts a soft, padded construction with relaxed seams and a smooth, fleece-like inner lining for easy wearing.<br/><br/>\r\n- Nylon<br/>\r\n- Hooded neckline<br/>\r\n- Long sleeves<br/>\r\n- Zip fastening<br/>\r\n- 4 pockets style<br/>\r\n- Slim fit<br/>\r\n- Lined', 1589, 05, 2),
(00000000041, 'Mango Crystals Cotton Sweatshirt', 'The instant shift from drab to fab made effortless with a piece of Mango in the ensemble. Slip into the autumnal warmth as this long-sleeved sweatshirt defines a quirky presence through embellished gem and embroidered detailing.<br/><br/>\r\nSizing runs one size larger<br/><br/>\r\n- Polyblend<br/>\r\n- Round neckline<br/>\r\n- Long sleeves<br/>\r\n- Faceted crystal embellishments<br/>\r\n- Message embroidery<br/>\r\n- Ribbed trim<br/>\r\n- Regular fit<br/>\r\n- Unlined<br/>', 339, 06, 2),
(00000000042, 'Mango Contrast Panels Sweatshirt', 'Keep yourself nice and warm with this lovely, homely little number. Designed by Mango, this item boasts a soft, melange-style construction that is styled with relaxed seams and side slits.<br/><br/>\r\nSizing runs one size larger<br/><br/>\r\n- Cotton blend<br/>\r\n- Round neckline<br/>\r\n- Long sleeves<br/>\r\n- Relaxed fit<br/>\r\n- Unlined<br/>', 339, 06, 2),
(00000000043, 'MILLOGREM Fringe Sweatshirts', 'Millo of Millogrem means fulfillment and together.<br/>\r\nThe philosophy of brand is to make clothe can fulfill the mind of everybody not classify the people by styles.', 729, 06, 2),
(00000000044, 'Something Borrowed\nWild One Oversized Tee', 'Taking the modernist inspiration for a laid back presence, this boxy tee by Something Borrowed sets to be a wardrobe staple with embroidered detailing on the oversized silhouette. <br/><br/>\r\n- Polyblend<br/>\r\n- Round neckline<br/>\r\n- Short sleeves<br/>\r\n- Embroidered "Wild One" detail<br/>\r\n- Chest pocket<br/>\r\n- Uneven hem<br/>\r\n- Relaxed fit<br/>\r\n- Unlined<br/>', 179, 07, 2),
(00000000045, 'Calvin Klein 2 Tone Logo Mesh Scoop Back Short Sleeve Tee', 'Vibrant and fun is just how you should start your work out with - so invest in this tee from Calvin Klein and push yourself to the limit. Designed with a solid splash of colour, this tee features a mesh design for a breathable fit.<br/><br/>\r\n- Nylon blend<br/>\r\n- Round neckline<br/>\r\n- Short sleeves<br/>\r\n- Scoop back<br/>\r\n- Regular fit<br/>\r\n- Unlined', 690, 07, 2),
(00000000046, 'Cotton On Tbar Fox Graphic Tee', 'Exhibit that laid back presence in your off-duty mode with a Cotton On top. The T-bar Fox tee features contrast trims and graphic prints to deliver retro flair and comfort.<br/><br/>\r\n- Cotton <br/>\r\n- Round neckline<br/>\r\n- Short sleeves<br/>\r\n- Contrast trim<br/>\r\n- Regular fit<br/>\r\n- Unlined', 119, 07, 2),
(00000000047, 'MadeWell Whisper Cotton V-Neck Pocket Tee', 'A wardrobe-essential pocket tee with a deep V-neckline is cut from soft slub cotton and finished with sporty stripes.\r\n26 1/2" length (size Medium)</br></br>\r\n-V-neck</br>\r\n-Short sleeves</br>\r\n-Chest patch pocket</br>\r\n-100% cotton</br>\r\n-Machine wash cold, tumble dry low</br>\r\n-Imported</br>\r\n-t.b.d.</br>', 205, 07, 2),
(00000000048, 'NIKE FUTURA ICON TEE', 'A reliable basic, the Futura Icon tee has been printed with the swoosh branding that helped make Nike an iconic household name. Cut from a soft cotton jersey, the tee is a favourite for sportswear enthusiasts.<br/><br/>\r\n\r\n100% Cotton<br/>\r\nRibbed Crew Neck<br/>\r\nSwoosh Branding<br/>\r\nStyle Code: 696707-104<br/>', 245, 03, 1),
(00000000049, 'CARHARTT BUTTON DOWN POCKET SHIRT', 'Established in Detroit, Carhartt have continued to create quality work wear since their inception back in 1889. Their Button Down Pocket Shirt sees the American heritage label redefine a classic silhouette with a contemporary cut and excellent attention to detail.<br/><br/>\r\n\r\n100% Cotton<br/>\r\n4.7oz Garment Washed Fabric<br/>\r\nButton Down Collar<br/>\r\nChest Pocket<br/>\r\nWoven Branded Tab<br/>', 575, 04, 1),
(00000000050, 'LACOSTE SHORT SLEEVE BUTTON DOWN OXFORD SHIRT', 'The history of Lacoste begins with a tennis legend whose innovations changed the entire sport and revolutionized the clothing industry forever. Highlighting a timeless and elegant design, this short sleeved shirt is crafted in Oxford cotton for an easy-to-wear summer essential, finished with the signature green crocodile to chest.-<br/>\r\n\r\n100% Cotton<br/>\r\nOxford Cotton<br/>\r\nButton Down Collar<br/>\r\nGreen Crocodile Chest Embroidered', 825, 04, 1),
(00000000052, 'WAREHOUSE Lace Bow Jumper', 'Compose the OOTD with an on-trend aesthetic and elegance that gets your seasonal transition done effortlessly. Styled in slouchy silhouette while accompanied by lace bow motif to give this jumper a romantic flair.<br/><br/>\r\n\r\n- Viscose blend<br/>\r\n- Round neckline<br/>\r\n- Long sleeves<br/>\r\n- Ribbed trim<br/>\r\n- Lace and embroidered bow motif<br/>\r\n- Regular fit<br/>\r\n- Unlined', 549, 06, 2),
(00000000053, 'ZALORA Premium Lace Skirt', 'Have fun with pairings and showcase that enthusiasm towards fashion with ZALORA. Blessed in a gorgeous hue with lace details, that luxe vibe is confidently expressed.<br/><br/>\r\n\r\n- Polyblend<br/>\r\n- Zip fastening<br/>\r\n- Mid rise<br/>\r\n- Regular fit<br/>\r\n- Lined', 249, 08, 2),
(00000000054, 'ESPRIT Light Woven Midi Skirt', 'Perfect for the urban ladies, ESPRIT enhances your weekend with that effortless vibe through the pastel hue fashioned in mesh details that boost a girly presence.<br/><br/>\r\n\r\nSizing runs one size larger<br/><br/>\r\n\r\n- Polyester<br/>\r\n- Back zip fastening<br/>\r\n- Mid rise<br/>\r\n- Regular fit<br/>\r\n- Lined', 699, 08, 2);

-- --------------------------------------------------------

--
-- Table structure for table `clothes`
--

DROP TABLE IF EXISTS `clothes`;
CREATE TABLE `clothes` (
  `clothes_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `category_id` int(11) NOT NULL,
  `color_id` int(3) NOT NULL,
  `size_id` int(11) NOT NULL,
  `image_url` varchar(250) NOT NULL,
  `clothes_date_avaliable` date DEFAULT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clothes`
--

INSERT INTO `clothes` (`clothes_id`, `category_id`, `color_id`, `size_id`, `image_url`, `clothes_date_avaliable`, `quantity`) VALUES
(00000000001, 1, 5, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_midblue_ay61-a331-85-zg-095_th_1.jpg', '2017-03-31', 10),
(00000000002, 1, 7, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_military_ay61-a331-85-zg-399_th_1.jpg', '2018-03-31', 10),
(00000000013, 3, 1, 13, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidasxwhitemountaineering_logotee_black_bq0952_hh_1.jpg', '2017-03-27', 88),
(00000000014, 3, 2, 12, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidas_xwhitemountaineering_logotee_white_bq0951_gj_1.jpg', '2017-03-27', 88),
(00000000056, 25, 6, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_1.jpg', '2017-03-12', 10),
(00000000059, 25, 7, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_1.jpg', '2017-03-12', 10),
(00000000060, 25, 1, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_1.jpg', '2017-03-12', 10),
(00000000061, 26, 1, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_1.jpg', '2017-03-12', 9),
(00000000062, 26, 5, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_1.jpg', '2017-03-12', 10),
(00000000063, 27, 6, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_woodland_171atnh-csm06-wd_ja_1.jpg', '2017-03-12', 10),
(00000000064, 27, 8, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_grey_171atnh-csm04-gy_cj_1.jpg', '2017-03-12', 10),
(00000000065, 28, 8, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_grey_1c80113015-gy_ah_1.jpg', '2017-03-12', 7),
(00000000066, 28, 1, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_black_1c80113015-bk_eh_1.jpg', '2017-03-12', 10),
(00000000067, 28, 5, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_navy_1c80113015-ny_cw_1.jpg', '2017-03-12', 10),
(00000000068, 29, 1, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumablack_572577-01_ah_1.jpg', '2017-03-12', 9),
(00000000069, 29, 2, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumawhite_572577-02_sh_1.jpg', '2017-03-12', 10),
(00000000070, 29, 9, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_burntolive_572577-18_th_1.jpg', '2017-03-12', 10),
(00000000071, 30, 5, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/5/25-03-2017_nigelcabourn_xlybrocposhirt_indigo_ncos-ss17-s-58-in_mb_1.jpg', NULL, 10),
(00000000072, 31, 2, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_1.jpg', NULL, 10),
(00000000073, 31, 5, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_sky_mhl-0071-sky_sp_1.jpg', NULL, 10),
(00000000074, 2, 1, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_black_i718-9974-01-241_sp_1.jpg', '2017-03-27', 10),
(00000000075, 2, 2, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_offwhite_i718-9974-01-044_hh_1.jpg', '2017-03-27', 10),
(00000000076, 2, 5, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_navy_i718-9974-01-035_sp_1.jpg', '2017-03-27', 10),
(00000000077, 32, 9, 3, 'https://www.bauhaus.com.hk/UploadFiles/Photo/LM2141290042301.jpg', '2017-03-28', 10),
(00000000078, 33, 9, 3, 'http://nord.imgix.net/Zoom/13/_13115353.jpg?fit=fill&bg=FFF&fm=jpg&w=704&h=1080&dpr=1.5&q=52.5', '2017-03-28', 10),
(00000000079, 34, 6, 3, 'https://www.bauhaus.com.hk/UploadFiles/Photo/RW2142350339301.jpg', '2017-03-28', 10),
(00000000080, 34, 1, 3, 'https://www.bauhaus.com.hk/UploadFiles/Photo/RW2142350310101.jpg', '2017-03-28', 10),
(00000000083, 36, 1, 3, 'http://nord.imgix.net/Zoom/11/_100111831.jpg?fit=fill&bg=FFF&fm=jpg&w=704&h=1080&dpr=1.5&q=52.5', '2017-03-28', 10),
(00000000084, 36, 2, 3, 'http://nord.imgix.net/Zoom/19/_100523099.jpg?fit=fill&bg=FFF&fm=jpg&w=391&h=600&dpr=1.5&q=52.5', '2017-03-28', 10),
(00000000085, 37, 8, 3, 'http://nord.imgix.net/Zoom/16/_100522836.jpg?fit=fill&bg=FFF&fm=jpg&w=704&h=1080&dpr=1.5&q=52.5', '2017-03-28', 9),
(00000000086, 39, 5, 3, 'https://dynamic.zacdn.com/CUPRXwAoDuNLzc8dtLwHTie4CqU=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/a-in-girls-8306-4376474-2.jpg', '2017-04-09', 49),
(00000000087, 39, 5, 3, 'https://dynamic.zacdn.com/hg80ahODEJrAhIv2kiaDA-yCmaM=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/a-in-girls-8486-6376474-2.jpg', '2017-04-09', 49),
(00000000088, 40, 5, 3, 'https://dynamic.zacdn.com/OcOCT8gAcV6loJNquY2JmAcLjwo=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/coldwear-9111-1740864-6.jpg', '2017-04-09', 50),
(00000000089, 40, 3, 3, 'https://dynamic.zacdn.com/teAIHGQEsNHvnzgYRZdRvekl-xo=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/coldwear-8934-0740864-6.jpg', '2017-04-09', 50),
(00000000090, 41, 1, 2, 'https://dynamic.zacdn.com/mtPEjEP1UuI6WS_ll0G0FsEpt5I=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/mango-8321-0667764-6.jpg', '2017-04-09', 50),
(00000000091, 42, 8, 2, 'https://dynamic.zacdn.com/eFnJrbOXJUQ4eMP_6sEsKruhiSI=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/mango-3649-6767664-6.jpg', '2017-04-09', 50),
(00000000092, 43, 2, 3, 'https://dynamic.zacdn.com/onXTTmk-mpUOWnnLwQ1xXPNjpk0=/fit-in/762x1100/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/millogrem-0445-5447374-1.jpg', '2017-04-09', 30),
(00000000093, 43, 9, 3, 'https://dynamic.zacdn.com/3udhkbfvsbcNFpNcDALqoDvi4d8=/fit-in/762x1100/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/millogrem-0571-7447374-1.jpg', '2017-04-09', 30),
(00000000094, 43, 5, 3, 'https://dynamic.zacdn.com/_6BWN_aEaSLyt5DurXgfuPQpxUg=/fit-in/762x1100/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/millogrem-0625-8447374-1.jpg', '2017-04-09', 20),
(00000000095, 44, 8, 2, 'https://dynamic.zacdn.com/SCOtdVsEwSnKaVoh_S28-h5wIUY=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/something-borrowed-3321-6917174-5.jpg', '2017-04-09', 27),
(00000000096, 44, 9, 2, 'https://dynamic.zacdn.com/7-fmZiUErqo2apSoTZfSEXRzXL8=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/something-borrowed-4524-7917174-5.jpg', '2017-04-09', 40),
(00000000097, 44, 2, 2, 'https://dynamic.zacdn.com/fVi9JIhtqqxZIl4dfmWC40aUMK4=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/something-borrowed-9277-5917174-5.jpg', '2017-04-09', 30),
(00000000098, 45, 8, 2, 'https://dynamic.zacdn.com/e-3BWCyWew_-nGixL-o3tSlxFgo=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/calvin-klein-8268-2942374-5.jpg', '2017-04-09', 20),
(00000000099, 45, 4, 2, 'https://dynamic.zacdn.com/Sc58TnG0DvPvmrkrx_ZceQDWohI=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/calvin-klein-5663-3942374-5.jpg', '2017-04-09', 30),
(00000000100, 46, 2, 3, 'https://dynamic.zacdn.com/6Mznr6ThiEdrAnN4DvfQWnYVQLM=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/cotton-on-6535-9818264-6.jpg', '2017-04-09', 20),
(00000000101, 46, 1, 3, 'https://dynamic.zacdn.com/waVBZ3RobpQG2BW9Ikx7BuKAuTY=/fit-in/762x1100/filters:quality(90):fill(ffffff)/http://static.hk.zalora.net/p/cotton-on-6592-7818264-6.jpg', '2017-04-09', 50),
(00000000102, 47, 2, 3, 'http://nord.imgix.net/Zoom/4/_100516124.jpg?fit=fill&bg=FFF&fm=jpg&w=704&h=1080&dpr=1.5&q=52.5', '2017-03-28', 10),
(00000000103, 47, 3, 3, 'http://nord.imgix.net/Zoom/19/_100516299.jpg?fit=fill&bg=FFF&fm=jpg&w=704&h=1080&dpr=1.5&q=52.5', '2017-03-28', 10),
(00000000104, 48, 2, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_nike_futuraicontee_white_black_696707-104_sh_1.jpg', '2017-04-12', 20),
(00000000105, 48, 1, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_black_white_sh_1.jpg', '2017-04-12', 20),
(00000000106, 48, 8, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_carbonheatherobsidian_cj_1.jpg', '2017-04-12', 20),
(00000000107, 49, 2, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/3/0/30-08-2016_carhartt_buttondownpocketshirt_white_eh_1.jpg', '2017-04-12', 10),
(00000000108, 49, 5, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_blue_i022069-ky00_gj_1.jpg', '2017-04-12', 10),
(00000000109, 49, 4, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_pink_i022069-67300_eh_1.jpg', '2017-04-12', 10),
(00000000110, 50, 2, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_white_ch2294-00-800_cj_1.jpg', '2017-04-12', 20),
(00000000111, 50, 5, 3, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_lightblue_ch2294-00-b3_sp_1.jpg', '2017-04-12', 20),
(00000000125, 52, 1, 2, 'http://static.hk.zalora.net/p/warehouse-3915-9816764-6.jpg', '2017-04-12', 30),
(00000000126, 52, 2, 2, 'http://static.hk.zalora.net/p/warehouse-8485-7816764-6.jpg', '2017-04-12', 10),
(00000000127, 53, 3, 2, 'http://static.hk.zalora.net/p/zalora-2720-0027274-5.jpg', '2017-04-12', 20),
(00000000128, 53, 1, 2, 'http://static.hk.zalora.net/p/zalora-2496-1027274-5.jpg', '2017-04-12', 20),
(00000000129, 54, 4, 2, 'http://static.hk.zalora.net/p/esprit-1550-5634374-3.jpg', '2017-04-12', 10),
(00000000130, 54, 3, 2, 'http://static.hk.zalora.net/p/esprit-6595-5489374-5.jpg', '2017-04-12', 10),
(00000000131, 54, 5, 3, 'http://static.hk.zalora.net/p/esprit-6542-5149274-5.jpg', '2017-04-12', 10);

-- --------------------------------------------------------

--
-- Table structure for table `clothes_image`
--

DROP TABLE IF EXISTS `clothes_image`;
CREATE TABLE `clothes_image` (
  `image_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `clothes_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `image_url` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clothes_image`
--

INSERT INTO `clothes_image` (`image_id`, `clothes_id`, `image_url`) VALUES
(00000000002, 00000000003, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidasxwhitemountaineering_logotee_black_bq0952_hh_1.jpg'),
(00000000011, 00000000071, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/5/25-03-2017_nigelcabourn_xlybrocposhirt_indigo_ncos-ss17-s-58-in_mb_1.jpg'),
(00000000012, 00000000071, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/5/25-03-2017_nigelcabourn_xlybrocposhirt_indigo_ncos-ss17-s-58-in_mb_2.jpg'),
(00000000013, 00000000071, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/5/25-03-2017_nigelcabourn_xlybrocposhirt_indigo_ncos-ss17-s-58-in_mb_3.jpg'),
(00000000014, 00000000071, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/5/25-03-2017_nigelcabourn_xlybrocposhirt_indigo_ncos-ss17-s-58-in_mb_4.jpg'),
(00000000015, 00000000000, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/5/25-03-2017_nigelcabourn_xlybrocposhirt_indigo_ncos-ss17-s-58-in_mb_5.jpg'),
(00000000016, 00000000071, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/5/25-03-2017_nigelcabourn_xlybrocposhirt_indigo_ncos-ss17-s-58-in_mb_m1.jpg'),
(00000000017, 00000000071, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/5/25-03-2017_nigelcabourn_xlybrocposhirt_indigo_ncos-ss17-s-58-in_mb_m2.jpg'),
(00000000018, 00000000071, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/5/25-03-2017_nigelcabourn_xlybrocposhirt_indigo_ncos-ss17-s-58-in_mb_m3.jpg'),
(00000000019, 00000000072, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_1.jpg'),
(00000000020, 00000000072, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_3.jpg'),
(00000000021, 00000000072, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_2.jpg'),
(00000000022, 00000000072, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_5.jpg'),
(00000000023, 00000000072, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_6.jpg'),
(00000000024, 00000000072, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_4.jpg'),
(00000000025, 00000000072, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_m1.jpg'),
(00000000026, 00000000072, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_m2.jpg'),
(00000000027, 00000000072, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_white_mhl-0071-whi_cj_m3.jpg'),
(00000000028, 00000000073, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_sky_mhl-0071-sky_sp_1.jpg'),
(00000000029, 00000000073, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_sky_mhl-0071-sky_sp_4.jpg'),
(00000000030, 00000000073, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_sky_mhl-0071-sky_sp_3.jpg'),
(00000000031, 00000000073, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_sky_mhl-0071-sky_sp_2.jpg'),
(00000000032, 00000000073, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_sky_mhl-0071-sky_sp_5.jpg'),
(00000000033, 00000000073, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_sky_mhl-0071-sky_sp_m1.jpg'),
(00000000034, 00000000073, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_sky_mhl-0071-sky_sp_m2.jpg'),
(00000000035, 00000000073, 'https://www.endclothing.com/media/catalog/product/cache/0/image/500x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_mhl_bymargarethowellbasicshirt_sky_mhl-0071-sky_sp_m3.jpg'),
(00000000055, 00000000074, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_black_i718-9974-01-241_sp_1.jpg'),
(00000000056, 00000000074, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_black_i718-9974-01-241_sp_2.jpg'),
(00000000057, 00000000074, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_black_i718-9974-01-241_sp_3.jpg'),
(00000000058, 00000000074, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_black_i718-9974-01-241_sp_4.jpg'),
(00000000059, 00000000074, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_black_i718-9974-01-241_sp_m1.jpg'),
(00000000060, 00000000074, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_black_i718-9974-01-241_sp_m2.jpg'),
(00000000061, 00000000074, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_black_i718-9974-01-241_sp_m3.jpg'),
(00000000062, 00000000013, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidasxwhitemountaineering_logotee_black_bq0952_hh_1.jpg'),
(00000000063, 00000000013, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidasxwhitemountaineering_logotee_black_bq0952_hh_4.jpg'),
(00000000064, 00000000013, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidasxwhitemountaineering_logotee_black_bq0952_hh_2.jpg'),
(00000000065, 00000000013, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidasxwhitemountaineering_logotee_black_bq0952_hh_3.jpg'),
(00000000067, 00000000013, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidasxwhitemountaineering_logotee_black_bq0952_hh_m1.jpg'),
(00000000068, 00000000013, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidasxwhitemountaineering_logotee_black_bq0952_hh_m2.jpg'),
(00000000069, 00000000000, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidasxwhitemountaineering_logotee_black_bq0952_hh_m3.jpg'),
(00000000070, 00000000014, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidas_xwhitemountaineering_logotee_white_bq0951_gj_1.jpg'),
(00000000071, 00000000014, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidas_xwhitemountaineering_logotee_white_bq0951_gj_4.jpg'),
(00000000072, 00000000014, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidas_xwhitemountaineering_logotee_white_bq0951_gj_3.jpg'),
(00000000073, 00000000014, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidas_xwhitemountaineering_logotee_white_bq0951_gj_2.jpg'),
(00000000074, 00000000014, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidas_xwhitemountaineering_logotee_white_bq0951_gj_m1.jpg'),
(00000000075, 00000000014, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidas_xwhitemountaineering_logotee_white_bq0951_gj_m2.jpg'),
(00000000076, 00000000014, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_adidas_xwhitemountaineering_logotee_white_bq0951_gj_m3.jpg'),
(00000000077, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_1.jpg'),
(00000000078, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_4.jpg'),
(00000000079, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_3.jpg'),
(00000000080, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_2.jpg'),
(00000000081, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_5.jpg'),
(00000000082, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_6.jpg'),
(00000000083, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_7.jpg'),
(00000000085, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_m1.jpg'),
(00000000086, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_m2.jpg'),
(00000000087, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_m3.jpg'),
(00000000088, 00000000056, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_woodland_171benh-jkm01-wd_ja_m4.jpg'),
(00000000089, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_1.jpg'),
(00000000090, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_6.jpg'),
(00000000091, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_5.jpg'),
(00000000092, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_7.jpg'),
(00000000093, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_4.jpg'),
(00000000094, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_3.jpg'),
(00000000095, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_2.jpg'),
(00000000096, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_m1.jpg'),
(00000000097, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_m2.jpg'),
(00000000098, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_m3.jpg'),
(00000000099, 00000000059, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_olivedrab_171benh-jkm01-od_hh_m4.jpg'),
(00000000100, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_1.jpg'),
(00000000101, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_6.jpg'),
(00000000102, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_5.jpg'),
(00000000103, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_4.jpg'),
(00000000104, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_7.jpg'),
(00000000105, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_3.jpg'),
(00000000106, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_2.jpg'),
(00000000107, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_m1.jpg'),
(00000000108, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_m2.jpg'),
(00000000109, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_m4.jpg'),
(00000000110, 00000000060, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_m-65jacket_black_171benh-jkm01-bk_hh_m3.jpg'),
(00000000111, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_1.jpg'),
(00000000112, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_3.jpg'),
(00000000113, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_2.jpg'),
(00000000114, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_4.jpg'),
(00000000115, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_5.jpg'),
(00000000116, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_6.jpg'),
(00000000117, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_7.jpg'),
(00000000118, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_m1.jpg'),
(00000000119, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_m2.jpg'),
(00000000120, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_m3.jpg'),
(00000000121, 00000000061, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_black_171tsnh-jkm02-bk_mg_m4.jpg'),
(00000000122, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_1.jpg'),
(00000000123, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_2.jpg'),
(00000000124, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_3.jpg'),
(00000000125, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_4.jpg'),
(00000000126, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_5.jpg'),
(00000000127, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_7.jpg'),
(00000000128, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_6.jpg'),
(00000000129, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_8.jpg'),
(00000000130, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_m1.jpg'),
(00000000131, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_m2.jpg'),
(00000000132, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_m3.jpg'),
(00000000133, 00000000062, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_baseballjacket_navy_171tsnh-jkm02-ny_mg_m4.jpg'),
(00000000134, 00000000063, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_woodland_171atnh-csm06-wd_ja_1.jpg'),
(00000000135, 00000000063, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_woodland_171atnh-csm06-wd_ja_2.jpg'),
(00000000136, 00000000063, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_woodland_171atnh-csm06-wd_ja_3.jpg'),
(00000000137, 00000000063, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_woodland_171atnh-csm06-wd_ja_4.jpg'),
(00000000138, 00000000063, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_woodland_171atnh-csm06-wd_ja_m1.jpg'),
(00000000139, 00000000063, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_woodland_171atnh-csm06-wd_ja_m2.jpg'),
(00000000140, 00000000063, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_woodland_171atnh-csm06-wd_ja_m3.jpg'),
(00000000141, 00000000064, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_grey_171atnh-csm04-gy_cj_1.jpg'),
(00000000142, 00000000064, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_grey_171atnh-csm04-gy_cj_4.jpg'),
(00000000143, 00000000064, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_grey_171atnh-csm04-gy_cj_2.jpg'),
(00000000144, 00000000064, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_grey_171atnh-csm04-gy_cj_3.jpg'),
(00000000145, 00000000064, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_grey_171atnh-csm04-gy_cj_5.jpg'),
(00000000146, 00000000064, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_grey_171atnh-csm04-gy_cj_m1.jpg'),
(00000000147, 00000000064, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_grey_171atnh-csm04-gy_cj_m2.jpg'),
(00000000148, 00000000064, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/1/11-03-2017_neighborhood_classichoody_grey_171atnh-csm04-gy_cj_m3.jpg'),
(00000000149, 00000000065, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_grey_1c80113015-gy_ah_1.jpg'),
(00000000150, 00000000065, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_grey_1c80113015-gy_ah_3.jpg'),
(00000000151, 00000000065, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_grey_1c80113015-gy_ah_2.jpg'),
(00000000152, 00000000065, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_grey_1c80113015-gy_ah_4.jpg'),
(00000000153, 00000000065, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/0/10-03-2017_abathingape_collegecrewsweat_grey_1c80113015-gy_mb_m1.jpg'),
(00000000154, 00000000065, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/0/10-03-2017_abathingape_collegecrewsweat_grey_1c80113015-gy_mb_m2.jpg'),
(00000000155, 00000000065, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/0/10-03-2017_abathingape_collegecrewsweat_grey_1c80113015-gy_mb_m3.jpg'),
(00000000156, 00000000066, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_black_1c80113015-bk_eh_1.jpg'),
(00000000157, 00000000066, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_black_1c80113015-bk_eh_4.jpg'),
(00000000158, 00000000066, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_black_1c80113015-bk_eh_2.jpg'),
(00000000159, 00000000066, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_black_1c80113015-bk_eh_3.jpg'),
(00000000160, 00000000066, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_black_1c80113015-bk_eh_m1.jpg'),
(00000000161, 00000000066, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_black_1c80113015-bk_eh_m2.jpg'),
(00000000162, 00000000066, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_black_1c80113015-bk_eh_m3.jpg'),
(00000000163, 00000000067, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_navy_1c80113015-ny_cw_1.jpg'),
(00000000164, 00000000067, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_navy_1c80113015-ny_cw_3.jpg'),
(00000000165, 00000000067, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_navy_1c80113015-ny_cw_2.jpg'),
(00000000166, 00000000067, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_navy_1c80113015-ny_cw_4.jpg'),
(00000000167, 00000000067, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_navy_1c80113015-ny_cw_m1.jpg'),
(00000000168, 00000000067, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_navy_1c80113015-ny_cw_m2.jpg'),
(00000000169, 00000000067, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-11-2016_abathingape_collegecrewsweat_navy_1c80113015-ny_cw_m3.jpg'),
(00000000171, 00000000068, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumablack_572577-01_ah_1.jpg'),
(00000000172, 00000000068, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumablack_572577-01_ah_2.jpg'),
(00000000173, 00000000068, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumablack_572577-01_ah_4.jpg'),
(00000000174, 00000000068, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumablack_572577-01_ah_3.jpg'),
(00000000175, 00000000068, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumablack_572577-01_ah_m1.jpg'),
(00000000176, 00000000068, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumablack_572577-01_ah_m2.jpg'),
(00000000177, 00000000068, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumablack_572577-01_ah_m3.jpg'),
(00000000178, 00000000068, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumablack_572577-01_ah_m4.jpg'),
(00000000179, 00000000069, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumawhite_572577-02_sh_1.jpg'),
(00000000180, 00000000069, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumawhite_572577-02_sh_3.jpg'),
(00000000181, 00000000069, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumawhite_572577-02_sh_2.jpg'),
(00000000182, 00000000069, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumawhite_572577-02_sh_4.jpg'),
(00000000183, 00000000069, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumawhite_572577-02_sh_m1.jpg'),
(00000000184, 00000000069, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumawhite_572577-02_sh_m2.jpg'),
(00000000185, 00000000069, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_pumawhite_572577-02_sh_m3.jpg'),
(00000000186, 00000000070, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_burntolive_572577-18_th_1.jpg'),
(00000000187, 00000000070, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_burntolive_572577-18_th_2.jpg'),
(00000000188, 00000000070, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_burntolive_572577-18_th_3.jpg'),
(00000000189, 00000000070, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_burntolive_572577-18_th_4.jpg'),
(00000000190, 00000000070, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_burntolive_572577-18_th_m1.jpg'),
(00000000191, 00000000070, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_burntolive_572577-18_th_m2.jpg'),
(00000000192, 00000000070, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_burntolive_572577-18_th_m3.jpg'),
(00000000193, 00000000070, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/8/08-03-2017_puma_xtrapstartracktee_burntolive_572577-18_th_m4.jpg'),
(00000000194, 00000000075, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_offwhite_i718-9974-01-044_hh_1.jpg'),
(00000000195, 00000000075, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_offwhite_i718-9974-01-044_hh_2.jpg'),
(00000000196, 00000000075, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_offwhite_i718-9974-01-044_hh_3.jpg'),
(00000000197, 00000000075, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_offwhite_i718-9974-01-044_hh_4.jpg'),
(00000000198, 00000000075, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_offwhite_i718-9974-01-044_hh_m1.jpg'),
(00000000199, 00000000075, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_offwhite_i718-9974-01-044_hh_m2.jpg'),
(00000000200, 00000000075, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_offwhite_i718-9974-01-044_hh_m3.jpg'),
(00000000201, 00000000076, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_navy_i718-9974-01-035_sp_1.jpg'),
(00000000202, 00000000076, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_navy_i718-9974-01-035_sp_3.jpg'),
(00000000203, 00000000076, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_navy_i718-9974-01-035_sp_2.jpg'),
(00000000204, 00000000076, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_navy_i718-9974-01-035_sp_4.jpg'),
(00000000205, 00000000076, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_navy_i718-9974-01-035_sp_m1.jpg'),
(00000000206, 00000000076, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_navy_i718-9974-01-035_sp_m2.jpg'),
(00000000207, 00000000076, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedma-1jacket_navy_i718-9974-01-035_sp_m3.jpg'),
(00000000208, 00000000077, 'https://www.bauhaus.com.hk/UploadFiles/Photo/LM2141290042301.jpg'),
(00000000209, 00000000077, 'https://www.bauhaus.com.hk/UploadFiles/Photo/LM2141290042302.jpg'),
(00000000214, 00000000078, 'http://nord.imgix.net/Zoom/13/_13115353.jpg'),
(00000000215, 00000000078, 'http://nord.imgix.net/Zoom/19/_13115299.jpg'),
(00000000216, 00000000078, 'http://nord.imgix.net/Zoom/5/_13115365.jpg'),
(00000000217, 00000000078, 'http://nord.imgix.net/Zoom/7/_13115367.jpg'),
(00000000218, 00000000078, 'http://nord.imgix.net/Zoom/7/_13104867.jpg'),
(00000000219, 00000000079, 'https://www.bauhaus.com.hk/UploadFiles/Photo/RW2142350339301.jpg'),
(00000000220, 00000000079, 'https://www.bauhaus.com.hk/UploadFiles/Photo/RW2142350339302.jpg'),
(00000000221, 00000000080, 'https://www.bauhaus.com.hk/UploadFiles/Photo/RW2142350310101.jpg'),
(00000000222, 00000000080, 'https://www.bauhaus.com.hk/UploadFiles/Photo/RW2142350310102.jpg'),
(00000000233, 00000000083, 'http://nord.imgix.net/Zoom/11/_100111831.jpg'),
(00000000234, 00000000083, 'http://nord.imgix.net/Zoom/7/_100119327.jpg'),
(00000000235, 00000000083, 'http://nord.imgix.net/Zoom/10/_100111690.jpg'),
(00000000236, 00000000083, 'http://nord.imgix.net/Zoom/8/_100118308.jpg'),
(00000000237, 00000000083, 'http://nord.imgix.net/Zoom/6/_100108826.jpg'),
(00000000238, 00000000084, 'http://nord.imgix.net/Zoom/19/_100523099.jpg'),
(00000000239, 00000000084, 'http://nord.imgix.net/Zoom/7/_100540247.jpg'),
(00000000240, 00000000084, 'http://nord.imgix.net/Zoom/1/_100523101.jpg'),
(00000000241, 00000000084, 'http://nord.imgix.net/Zoom/2/_100523102.jpg'),
(00000000242, 00000000084, 'http://nord.imgix.net/Zoom/3/_100523103.jpg'),
(00000000243, 00000000084, 'http://nord.imgix.net/Zoom/0/_100522180.jpg'),
(00000000244, 00000000085, 'http://nord.imgix.net/Zoom/16/_100522836.jpg'),
(00000000245, 00000000085, 'http://nord.imgix.net/Zoom/6/_100538086.jpg'),
(00000000246, 00000000085, 'http://nord.imgix.net/Zoom/3/_100522503.jpg'),
(00000000247, 00000000085, 'http://nord.imgix.net/Zoom/17/_100521377.jpg'),
(00000000248, 00000000085, 'http://nord.imgix.net/Zoom/4/_100522504.jpg'),
(00000000249, 00000000085, 'http://nord.imgix.net/Zoom/17/_100512917.jpg'),
(00000000250, 00000000085, 'http://nord.imgix.net/Zoom/3/_100518483.jpg'),
(00000000301, 00000000001, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_midblue_ay61-a331-85-zg-095_th_1.jpg'),
(00000000302, 00000000001, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_midblue_ay61-a331-85-zg-095_th_2.jpg'),
(00000000303, 00000000001, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_midblue_ay61-a331-85-zg-095_th_3.jpg'),
(00000000304, 00000000001, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_midblue_ay61-a331-85-zg-095_th_m1.jpg'),
(00000000305, 00000000001, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_midblue_ay61-a331-85-zg-095_th_m2.jpg'),
(00000000306, 00000000001, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_midblue_ay61-a331-85-zg-095_th_m3.jpg'),
(00000000307, 00000000002, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_military_ay61-a331-85-zg-399_th_1.jpg'),
(00000000308, 00000000002, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_military_ay61-a331-85-zg-399_th_2.jpg'),
(00000000309, 00000000002, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_military_ay61-a331-85-zg-399_th_3.jpg'),
(00000000310, 00000000002, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_military_ay61-a331-85-zg-399_th_m1.jpg'),
(00000000311, 00000000002, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_military_ay61-a331-85-zg-399_th_m2.jpg'),
(00000000312, 00000000002, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/1/01-03-2017_aspesi_garmentdyedfacecrewsweat_military_ay61-a331-85-zg-399_th_m3.jpg'),
(00000000313, 00000000086, 'http://static.hk.zalora.net/p/a-in-girls-8306-4376474-2.jpg'),
(00000000314, 00000000086, 'http://static.hk.zalora.net/p/a-in-girls-8305-4376474-1.jpg'),
(00000000315, 00000000086, 'http://static.hk.zalora.net/p/a-in-girls-8307-4376474-3.jpg'),
(00000000316, 00000000086, 'http://static.hk.zalora.net/p/a-in-girls-8307-4376474-4.jpg'),
(00000000317, 00000000086, 'http://static.hk.zalora.net/p/a-in-girls-8308-4376474-5.jpg'),
(00000000318, 00000000086, 'http://static.hk.zalora.net/p/a-in-girls-8308-4376474-6.jpg'),
(00000000319, 00000000086, 'http://static.hk.zalora.net/p/a-in-girls-8309-4376474-7.jpg'),
(00000000320, 00000000086, 'http://static.hk.zalora.net/p/a-in-girls-8309-4376474-8.jpg'),
(00000000321, 00000000087, 'http://static.hk.zalora.net/p/a-in-girls-8486-6376474-2.jpg'),
(00000000322, 00000000087, 'http://static.hk.zalora.net/p/a-in-girls-8486-6376474-1.jpg'),
(00000000323, 00000000087, 'http://static.hk.zalora.net/p/a-in-girls-8487-6376474-3.jpg'),
(00000000324, 00000000087, 'http://static.hk.zalora.net/p/a-in-girls-8487-6376474-4.jpg'),
(00000000325, 00000000087, 'http://static.hk.zalora.net/p/a-in-girls-8488-6376474-5.jpg'),
(00000000326, 00000000087, 'http://static.hk.zalora.net/p/a-in-girls-8489-6376474-6.jpg'),
(00000000327, 00000000087, 'http://static.hk.zalora.net/p/a-in-girls-8489-6376474-7.jpg'),
(00000000328, 00000000087, 'http://static.hk.zalora.net/p/a-in-girls-8490-6376474-8.jpg'),
(00000000329, 00000000088, 'http://static.hk.zalora.net/p/coldwear-9111-1740864-6.jpg'),
(00000000330, 00000000088, 'http://static.hk.zalora.net/p/coldwear-9108-1740864-1.jpg'),
(00000000331, 00000000088, 'http://static.hk.zalora.net/p/coldwear-9109-1740864-2.jpg'),
(00000000332, 00000000088, 'http://static.hk.zalora.net/p/coldwear-9109-1740864-3.jpg'),
(00000000333, 00000000088, 'http://static.hk.zalora.net/p/coldwear-9110-1740864-4.jpg'),
(00000000334, 00000000088, 'http://static.hk.zalora.net/p/coldwear-9110-1740864-5.jpg'),
(00000000335, 00000000089, 'http://static.hk.zalora.net/p/coldwear-8934-0740864-6.jpg'),
(00000000336, 00000000089, 'http://static.hk.zalora.net/p/coldwear-8931-0740864-1.jpg'),
(00000000337, 00000000089, 'http://static.hk.zalora.net/p/coldwear-8932-0740864-2.jpg'),
(00000000338, 00000000089, 'http://static.hk.zalora.net/p/coldwear-8932-0740864-3.jpg'),
(00000000339, 00000000089, 'http://static.hk.zalora.net/p/coldwear-8933-0740864-4.jpg'),
(00000000340, 00000000089, 'http://static.hk.zalora.net/p/coldwear-8933-0740864-5.jpg'),
(00000000341, 00000000090, 'http://static.hk.zalora.net/p/mango-8321-0667764-6.jpg'),
(00000000342, 00000000090, 'http://static.hk.zalora.net/p/mango-8318-0667764-1.jpg'),
(00000000343, 00000000090, 'http://static.hk.zalora.net/p/mango-8319-0667764-2.jpg'),
(00000000344, 00000000090, 'http://static.hk.zalora.net/p/mango-8319-0667764-3.jpg'),
(00000000345, 00000000090, 'http://static.hk.zalora.net/p/mango-8320-0667764-4.jpg'),
(00000000346, 00000000090, 'http://static.hk.zalora.net/p/mango-8320-0667764-5.jpg'),
(00000000347, 00000000091, 'http://static.hk.zalora.net/p/mango-3649-6767664-6.jpg'),
(00000000348, 00000000091, 'http://static.hk.zalora.net/p/mango-3647-6767664-1.jpg'),
(00000000349, 00000000091, 'http://static.hk.zalora.net/p/mango-3648-6767664-2.jpg'),
(00000000350, 00000000091, 'http://static.hk.zalora.net/p/mango-3648-6767664-3.jpg'),
(00000000351, 00000000091, 'http://static.hk.zalora.net/p/mango-3649-6767664-4.jpg'),
(00000000352, 00000000091, 'http://static.hk.zalora.net/p/mango-3649-6767664-5.jpg'),
(00000000353, 00000000092, 'http://static.hk.zalora.net/p/millogrem-0445-5447374-1.jpg'),
(00000000354, 00000000092, 'http://static.hk.zalora.net/p/millogrem-0445-5447374-2.jpg'),
(00000000355, 00000000092, 'http://static.hk.zalora.net/p/millogrem-0445-5447374-3.jpg'),
(00000000356, 00000000092, 'http://static.hk.zalora.net/p/millogrem-0446-5447374-4.jpg'),
(00000000357, 00000000092, 'http://static.hk.zalora.net/p/millogrem-0446-5447374-5.jpg'),
(00000000358, 00000000092, 'http://static.hk.zalora.net/p/millogrem-0446-5447374-6.jpg'),
(00000000359, 00000000092, 'http://static.hk.zalora.net/p/millogrem-0447-5447374-7.jpg'),
(00000000360, 00000000092, 'http://static.hk.zalora.net/p/millogrem-0447-5447374-8.jpg'),
(00000000361, 00000000093, 'http://static.hk.zalora.net/p/millogrem-0571-7447374-1.jpg'),
(00000000362, 00000000093, 'http://static.hk.zalora.net/p/millogrem-0571-7447374-2.jpg'),
(00000000363, 00000000093, 'http://static.hk.zalora.net/p/millogrem-0572-7447374-3.jpg'),
(00000000364, 00000000093, 'http://static.hk.zalora.net/p/millogrem-0572-7447374-4.jpg'),
(00000000365, 00000000093, 'http://static.hk.zalora.net/p/millogrem-0572-7447374-5.jpg'),
(00000000366, 00000000093, 'http://static.hk.zalora.net/p/millogrem-0573-7447374-6.jpg'),
(00000000367, 00000000093, 'http://static.hk.zalora.net/p/millogrem-0573-7447374-7.jpg'),
(00000000368, 00000000093, 'http://static.hk.zalora.net/p/millogrem-0573-7447374-8.jpg'),
(00000000369, 00000000094, 'http://static.hk.zalora.net/p/millogrem-0625-8447374-1.jpg'),
(00000000370, 00000000094, 'http://static.hk.zalora.net/p/millogrem-0625-8447374-2.jpg'),
(00000000371, 00000000094, 'http://static.hk.zalora.net/p/millogrem-0626-8447374-3.jpg'),
(00000000372, 00000000094, 'http://static.hk.zalora.net/p/millogrem-0626-8447374-4.jpg'),
(00000000373, 00000000094, 'http://static.hk.zalora.net/p/millogrem-0626-8447374-5.jpg'),
(00000000374, 00000000094, 'http://static.hk.zalora.net/p/millogrem-0627-8447374-6.jpg'),
(00000000375, 00000000094, 'http://static.hk.zalora.net/p/millogrem-0627-8447374-7.jpg'),
(00000000376, 00000000094, 'http://static.hk.zalora.net/p/millogrem-0628-8447374-8.jpg'),
(00000000377, 00000000095, 'http://static.hk.zalora.net/p/something-borrowed-3321-6917174-5.jpg'),
(00000000378, 00000000095, 'http://static.hk.zalora.net/p/something-borrowed-3317-6917174-1.jpg'),
(00000000379, 00000000095, 'http://static.hk.zalora.net/p/something-borrowed-3318-6917174-2.jpg'),
(00000000380, 00000000095, 'http://static.hk.zalora.net/p/something-borrowed-3319-6917174-3.jpg'),
(00000000381, 00000000095, 'http://static.hk.zalora.net/p/something-borrowed-3320-6917174-4.jpg'),
(00000000382, 00000000096, 'http://static.hk.zalora.net/p/something-borrowed-4524-7917174-5.jpg'),
(00000000383, 00000000096, 'http://static.hk.zalora.net/p/something-borrowed-4520-7917174-1.jpg'),
(00000000384, 00000000096, 'http://static.hk.zalora.net/p/something-borrowed-4521-7917174-2.jpg'),
(00000000385, 00000000096, 'http://static.hk.zalora.net/p/something-borrowed-4522-7917174-3.jpg'),
(00000000386, 00000000096, 'http://static.hk.zalora.net/p/something-borrowed-4523-7917174-4.jpg'),
(00000000387, 00000000097, 'http://static.hk.zalora.net/p/something-borrowed-9277-5917174-5.jpg'),
(00000000388, 00000000097, 'http://static.hk.zalora.net/p/something-borrowed-9273-5917174-1.jpg'),
(00000000389, 00000000097, 'http://static.hk.zalora.net/p/something-borrowed-9275-5917174-2.jpg'),
(00000000390, 00000000097, 'http://static.hk.zalora.net/p/something-borrowed-9276-5917174-3.jpg'),
(00000000391, 00000000097, 'http://static.hk.zalora.net/p/something-borrowed-9276-5917174-4.jpg'),
(00000000392, 00000000098, 'http://static.hk.zalora.net/p/calvin-klein-8268-2942374-5.jpg'),
(00000000393, 00000000098, 'http://static.hk.zalora.net/p/calvin-klein-8266-2942374-1.jpg'),
(00000000394, 00000000098, 'http://static.hk.zalora.net/p/calvin-klein-8267-2942374-2.jpg'),
(00000000395, 00000000098, 'http://static.hk.zalora.net/p/calvin-klein-8267-2942374-3.jpg'),
(00000000396, 00000000098, 'http://static.hk.zalora.net/p/calvin-klein-8268-2942374-4.jpg'),
(00000000397, 00000000099, 'http://static.hk.zalora.net/p/calvin-klein-5663-3942374-5.jpg'),
(00000000398, 00000000099, 'http://static.hk.zalora.net/p/calvin-klein-5661-3942374-1.jpg'),
(00000000399, 00000000099, 'http://static.hk.zalora.net/p/calvin-klein-5661-3942374-2.jpg'),
(00000000400, 00000000099, 'http://static.hk.zalora.net/p/calvin-klein-5662-3942374-3.jpg'),
(00000000401, 00000000099, 'http://static.hk.zalora.net/p/calvin-klein-5662-3942374-4.jpg'),
(00000000402, 00000000100, 'http://static.hk.zalora.net/p/cotton-on-6535-9818264-6.jpg'),
(00000000403, 00000000100, 'http://static.hk.zalora.net/p/cotton-on-6534-9818264-1.jpg'),
(00000000404, 00000000100, 'http://static.hk.zalora.net/p/cotton-on-6534-9818264-2.jpg'),
(00000000405, 00000000100, 'http://static.hk.zalora.net/p/cotton-on-6534-9818264-3.jpg'),
(00000000406, 00000000100, 'http://static.hk.zalora.net/p/cotton-on-6535-9818264-4.jpg'),
(00000000407, 00000000100, 'http://static.hk.zalora.net/p/cotton-on-6535-9818264-5.jpg'),
(00000000408, 00000000101, 'http://static.hk.zalora.net/p/cotton-on-6592-7818264-6.jpg'),
(00000000409, 00000000101, 'http://static.hk.zalora.net/p/cotton-on-6590-7818264-1.jpg'),
(00000000410, 00000000101, 'http://static.hk.zalora.net/p/cotton-on-6591-7818264-2.jpg'),
(00000000411, 00000000101, 'http://static.hk.zalora.net/p/cotton-on-6591-7818264-3.jpg'),
(00000000412, 00000000101, 'http://static.hk.zalora.net/p/cotton-on-6592-7818264-4.jpg');
INSERT INTO `clothes_image` (`image_id`, `clothes_id`, `image_url`) VALUES
(00000000413, 00000000101, 'http://static.hk.zalora.net/p/cotton-on-6592-7818264-5.jpg'),
(00000000414, 00000000102, 'http://nord.imgix.net/Zoom/4/_100516124.jpg'),
(00000000415, 00000000102, 'http://nord.imgix.net/Zoom/4/_100515864.jpg'),
(00000000416, 00000000102, 'http://nord.imgix.net/Zoom/5/_100515865.jpg'),
(00000000417, 00000000102, 'http://nord.imgix.net/Zoom/6/_100515866.jpg'),
(00000000418, 00000000102, 'http://nord.imgix.net/Zoom/7/_100515867.jpg'),
(00000000419, 00000000103, 'http://nord.imgix.net/Zoom/19/_100516299.jpg'),
(00000000420, 00000000103, 'http://nord.imgix.net/Zoom/0/_100516300.jpg'),
(00000000421, 00000000103, 'http://nord.imgix.net/Zoom/6/_100516506.jpg'),
(00000000422, 00000000103, 'http://nord.imgix.net/Zoom/7/_100516507.jpg'),
(00000000423, 00000000103, 'http://nord.imgix.net/Zoom/16/_100516736.jpg'),
(00000000424, 00000000104, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_nike_futuraicontee_white_black_696707-104_sh_1.jpg'),
(00000000425, 00000000104, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_nike_futuraicontee_white_black_696707-104_sh_2.jpg'),
(00000000426, 00000000104, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_nike_futuraicontee_white_black_696707-104_sh_3.jpg'),
(00000000427, 00000000104, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_nike_futuraicontee_white_black_696707-104_sh_m1.jpg'),
(00000000428, 00000000104, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_nike_futuraicontee_white_black_696707-104_sh_m2.jpg'),
(00000000429, 00000000104, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/2/4/24-03-2017_nike_futuraicontee_white_black_696707-104_sh_m3.jpg'),
(00000000430, 00000000105, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_black_white_sh_1.jpg'),
(00000000431, 00000000105, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_black_white_sh_2.jpg'),
(00000000432, 00000000105, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_black_white_sh_3.jpg'),
(00000000433, 00000000105, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/4/04-02-2017_nike_futuraicontee_black_white_696707-015_cw_m1.jpg'),
(00000000434, 00000000105, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/4/04-02-2017_nike_futuraicontee_black_white_696707-015_cw_m2.jpg'),
(00000000435, 00000000105, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/4/04-02-2017_nike_futuraicontee_black_white_696707-015_cw_m3.jpg'),
(00000000436, 00000000106, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_carbonheatherobsidian_cj_1.jpg'),
(00000000437, 00000000106, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_carbonheatherobsidian_cj_3.jpg'),
(00000000438, 00000000106, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_carbonheatherobsidian_cj_2.jpg'),
(00000000439, 00000000106, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_carbonheatherobsidian_cj_4.jpg'),
(00000000440, 00000000106, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_carbonheatherobsidian_cj_m2.jpg'),
(00000000441, 00000000106, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/3/13-07-2016_nike_futuraicontee_carbonheatherobsidian_cj_m3.jpg'),
(00000000442, 00000000107, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/3/0/30-08-2016_carhartt_buttondownpocketshirt_white_eh_1.jpg'),
(00000000443, 00000000107, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/3/0/30-08-2016_carhartt_buttondownpocketshirt_white_eh_5.jpg'),
(00000000444, 00000000107, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/3/0/30-08-2016_carhartt_buttondownpocketshirt_white_eh_2.jpg'),
(00000000445, 00000000107, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/3/0/30-08-2016_carhartt_buttondownpocketshirt_white_eh_4.jpg'),
(00000000446, 00000000107, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/3/0/30-08-2016_carhartt_buttondownpocketshirt_white_eh_3.jpg'),
(00000000447, 00000000107, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/3/0/30-08-2016_carhartt_buttondownpocketshirt_white_eh_m1.jpg'),
(00000000448, 00000000107, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/3/0/30-08-2016_carhartt_buttondownpocketshirt_white_eh_m2.jpg'),
(00000000449, 00000000107, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/3/0/30-08-2016_carhartt_buttondownpocketshirt_white_eh_m3.jpg'),
(00000000450, 00000000108, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_blue_i022069-ky00_gj_1.jpg'),
(00000000451, 00000000108, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_blue_i022069-ky00_gj_3.jpg'),
(00000000452, 00000000108, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_blue_i022069-ky00_gj_4.jpg'),
(00000000453, 00000000108, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_blue_i022069-ky00_gj_2.jpg'),
(00000000454, 00000000108, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_blue_i022069-ky00_gj_m1.jpg'),
(00000000455, 00000000108, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_blue_i022069-ky00_gj_m2.jpg'),
(00000000456, 00000000108, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_blue_i022069-ky00_gj_m3.jpg'),
(00000000457, 00000000109, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_pink_i022069-67300_eh_1.jpg'),
(00000000458, 00000000109, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_pink_i022069-67300_eh_2.jpg'),
(00000000459, 00000000109, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_pink_i022069-67300_eh_3.jpg'),
(00000000460, 00000000109, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_pink_i022069-67300_eh_4.jpg'),
(00000000461, 00000000109, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_pink_i022069-67300_eh_m1.jpg'),
(00000000462, 00000000109, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_pink_i022069-67300_eh_m2.jpg'),
(00000000463, 00000000109, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/0/2/02-12-2016_carhartt_buttondownpocketshirt_pink_i022069-67300_eh_m3.jpg'),
(00000000464, 00000000110, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_white_ch2294-00-800_cj_1.jpg'),
(00000000465, 00000000110, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_white_ch2294-00-800_cj_3.jpg'),
(00000000466, 00000000110, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_white_ch2294-00-800_cj_2.jpg'),
(00000000467, 00000000110, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_white_ch2294-00-800_cj_m1.jpg'),
(00000000468, 00000000110, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_white_ch2294-00-800_cj_m2.jpg'),
(00000000469, 00000000110, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_white_ch2294-00-800_cj_m3.jpg'),
(00000000470, 00000000111, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_lightblue_ch2294-00-b3_sp_1.jpg'),
(00000000471, 00000000111, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_lightblue_ch2294-00-b3_sp_3.jpg'),
(00000000472, 00000000111, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_lightblue_ch2294-00-b3_sp_2.jpg'),
(00000000473, 00000000111, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_lightblue_ch2294-00-b3_sp_m1.jpg'),
(00000000474, 00000000111, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_lightblue_ch2294-00-b3_sp_m2.jpg'),
(00000000475, 00000000111, 'https://www.endclothing.com/media/catalog/product/cache/0/image/1000x/9df78eab33525d08d6e5fb8d27136e95/1/9/19-01-2017_lacoste_shortsleevebuttondownoxfordshirt_lightblue_ch2294-00-b3_sp_m3.jpg'),
(00000000503, 00000000125, 'http://static.hk.zalora.net/p/warehouse-3915-9816764-6.jpg'),
(00000000504, 00000000125, 'http://static.hk.zalora.net/p/warehouse-3911-9816764-1.jpg'),
(00000000505, 00000000125, 'http://static.hk.zalora.net/p/warehouse-3913-9816764-2.jpg'),
(00000000506, 00000000125, 'http://static.hk.zalora.net/p/warehouse-3913-9816764-3.jpg'),
(00000000507, 00000000125, 'http://static.hk.zalora.net/p/warehouse-3914-9816764-4.jpg'),
(00000000508, 00000000125, 'http://static.hk.zalora.net/p/warehouse-3914-9816764-5.jpg'),
(00000000509, 00000000126, 'http://static.hk.zalora.net/p/warehouse-8485-7816764-6.jpg'),
(00000000510, 00000000126, 'http://static.hk.zalora.net/p/warehouse-8482-7816764-1.jpg'),
(00000000511, 00000000126, 'http://static.hk.zalora.net/p/warehouse-8483-7816764-2.jpg'),
(00000000512, 00000000126, 'http://static.hk.zalora.net/p/warehouse-8483-7816764-3.jpg'),
(00000000513, 00000000126, 'http://static.hk.zalora.net/p/warehouse-8484-7816764-4.jpg'),
(00000000514, 00000000126, 'http://static.hk.zalora.net/p/warehouse-8484-7816764-5.jpg'),
(00000000515, 00000000127, 'http://static.hk.zalora.net/p/zalora-2720-0027274-5.jpg'),
(00000000516, 00000000127, 'http://static.hk.zalora.net/p/zalora-2718-0027274-1.jpg'),
(00000000517, 00000000127, 'http://static.hk.zalora.net/p/zalora-2718-0027274-2.jpg'),
(00000000518, 00000000127, 'http://static.hk.zalora.net/p/zalora-2719-0027274-3.jpg'),
(00000000519, 00000000127, 'http://static.hk.zalora.net/p/zalora-2720-0027274-4.jpg'),
(00000000520, 00000000128, 'http://static.hk.zalora.net/p/zalora-2496-1027274-5.jpg'),
(00000000521, 00000000128, 'http://static.hk.zalora.net/p/zalora-2494-1027274-1.jpg'),
(00000000522, 00000000128, 'http://static.hk.zalora.net/p/zalora-2494-1027274-2.jpg'),
(00000000523, 00000000128, 'http://static.hk.zalora.net/p/zalora-2495-1027274-3.jpg'),
(00000000524, 00000000128, 'http://static.hk.zalora.net/p/zalora-2495-1027274-4.jpg'),
(00000000525, 00000000129, 'http://static.hk.zalora.net/p/esprit-1551-5634374-5.jpg'),
(00000000526, 00000000129, 'http://static.hk.zalora.net/p/esprit-1550-5634374-1.jpg'),
(00000000527, 00000000129, 'http://static.hk.zalora.net/p/esprit-1550-5634374-2.jpg'),
(00000000528, 00000000129, 'http://static.hk.zalora.net/p/esprit-1550-5634374-3.jpg'),
(00000000529, 00000000129, 'http://static.hk.zalora.net/p/esprit-1551-5634374-4.jpg'),
(00000000530, 00000000130, 'http://static.hk.zalora.net/p/esprit-6595-5489374-5.jpg'),
(00000000531, 00000000130, 'http://static.hk.zalora.net/p/esprit-6593-5489374-1.jpg'),
(00000000532, 00000000130, 'http://static.hk.zalora.net/p/esprit-6594-5489374-2.jpg'),
(00000000533, 00000000130, 'http://static.hk.zalora.net/p/esprit-6594-5489374-3.jpg'),
(00000000534, 00000000130, 'http://static.hk.zalora.net/p/esprit-6595-5489374-4.jpg'),
(00000000535, 00000000131, 'http://static.hk.zalora.net/p/esprit-6542-5149274-5.jpg'),
(00000000536, 00000000131, 'http://static.hk.zalora.net/p/esprit-6540-5149274-1.jpg'),
(00000000537, 00000000131, 'http://static.hk.zalora.net/p/esprit-6540-5149274-2.jpg'),
(00000000538, 00000000131, 'http://static.hk.zalora.net/p/esprit-6540-5149274-3.jpg'),
(00000000539, 00000000131, 'http://static.hk.zalora.net/p/esprit-6541-5149274-4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `clothes_review`
--

DROP TABLE IF EXISTS `clothes_review`;
CREATE TABLE `clothes_review` (
  `review_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `reviewer_name` varchar(50) NOT NULL,
  `comment` text,
  `category_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clothes_review`
--

INSERT INTO `clothes_review` (`review_id`, `reviewer_name`, `comment`, `category_name`) VALUES
(00000000001, 'a', 'a', 'ZALORA Premium Lace Skirt'),
(00000000002, 'MArin', 'good', 'ASPESI GARMENT DYED FACE CREW SWEAT');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `color_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `color` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `color`) VALUES
(00000000001, 'Black'),
(00000000002, 'White'),
(00000000003, 'Red'),
(00000000004, 'Pink'),
(00000000005, 'Blue'),
(00000000006, 'Camouflage'),
(00000000007, 'Green'),
(00000000008, 'Grey'),
(00000000009, 'Brown');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `gender_id` int(1) UNSIGNED ZEROFILL NOT NULL,
  `gender` varchar(10) NOT NULL,
  `gender_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_id`, `gender`, `gender_name`) VALUES
(1, 'Male', 'Men'),
(2, 'Female', 'Women');

-- --------------------------------------------------------

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `order_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `user_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `address` varchar(100) NOT NULL,
  `billing_name` varchar(40) NOT NULL,
  `order_status` varchar(30) NOT NULL,
  `deliver_date` date NOT NULL,
  `total_payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderlist`
--

INSERT INTO `orderlist` (`order_id`, `user_id`, `address`, `billing_name`, `order_status`, `deliver_date`, `total_payment`) VALUES
(00000000001, 00000000007, 'HK', 'CCCU', 'Success', '2017-03-18', 1989),
(00000000002, 00000000007, 'HK', 'CCCU2', 'Success', '2017-03-18', 4453),
(00000000003, 00000000007, 'HK', 'CCCU3', 'Success', '2017-03-18', 1989),
(00000000004, 00000000007, '', '', 'Success', '2017-03-18', 0),
(00000000005, 00000000007, '', '', 'Success', '2017-03-18', 1989),
(00000000006, 00000000007, '', '', 'Success', '2017-04-04', 5479),
(00000000007, 00000000007, '', '', 'Success', '2017-04-04', 5479),
(00000000008, 00000000007, '', '', 'Success', '2017-04-12', 10000),
(00000000009, 00000000007, '', '', 'Success', '2017-04-13', 329),
(00000000010, 00000000007, '', '', 'Success', '2017-04-13', 1353),
(00000000011, 00000000007, '', '', 'Success', '2017-04-15', 106001),
(00000000012, 00000000007, '', '', 'Success', '2017-04-15', 22316),
(00000000013, 00000000007, '', '', 'Success', '2017-04-15', 22316),
(00000000014, 00000000007, '', '', 'Success', '2017-04-15', 11158),
(00000000015, 00000000007, '', '', 'Success', '2017-04-15', 0),
(00000000016, 00000000007, '', '', 'Success', '2017-04-15', 17289),
(00000000017, 00000000007, '', '', 'Success', '2017-04-15', 537),
(00000000018, 00000000001, '', '', 'Success', '2017-04-18', 498),
(00000000019, 00000000002, '', '', 'Success', '2017-04-18', 44632),
(00000000020, 00000000002, '', '', 'Success', '2017-04-18', 28699),
(00000000021, 00000000002, '', '', 'Success', '2017-04-18', 26090),
(00000000022, 00000000001, '', '', 'Success', '2017-04-18', 5608),
(00000000023, 00000000001, 'HK', 'martin', 'Success', '2017-04-18', 3978);

-- --------------------------------------------------------

--
-- Table structure for table `order_clothes`
--

DROP TABLE IF EXISTS `order_clothes`;
CREATE TABLE `order_clothes` (
  `order_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `clothes_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `clothes_name` varchar(40) NOT NULL,
  `ordered_price` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_clothes`
--

INSERT INTO `order_clothes` (`order_id`, `clothes_id`, `quantity`, `clothes_name`, `ordered_price`) VALUES
(00000000001, 00000000065, 1, 'A BATHING APE COLLEGE CREW SWEAT', 0),
(00000000002, 00000000068, 1, 'PUMA X TRAPSTAR TRACK TEE', 0),
(00000000002, 00000000065, 1, 'A BATHING APE COLLEGE CREW SWEAT', 0),
(00000000002, 00000000063, 1, 'NEIGHBORHOOD CLASSIC HOODY', 0),
(00000000003, 00000000065, 1, 'A BATHING APE COLLEGE CREW SWEAT', 0),
(00000000005, 00000000065, 1, 'A BATHING APE COLLEGE CREW SWEAT', 0),
(00000000006, 00000000056, 1, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000007, 00000000056, 1, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000008, 00000000134, 1, 'Twice', 0),
(00000000009, 00000000068, 1, 'PUMA X TRAPSTAR TRACK TEE', 0),
(00000000010, 00000000085, 1, 'ELIZA J Floral Appliqué Ball Skirt', 0),
(00000000011, 00000000059, 19, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000012, 00000000059, 1, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000012, 00000000059, 3, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000013, 00000000059, 1, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000013, 00000000059, 3, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000014, 00000000060, 2, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000015, 00000000060, 1, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000016, 00000000089, 1, 'COLDWEAR Slim Fit Down Jacket Lined With', 0),
(00000000016, 00000000087, 1, 'A-IN GIRLS Fashion Denim Jacket', 0),
(00000000017, 00000000095, 3, 'Something Borrowed\nWild One Oversized Te', 0),
(00000000018, 00000000086, 1, 'A-IN GIRLS Fashion Denim Jacket', 0),
(00000000019, 00000000056, 8, 'NEIGHBORHOOD M-65 JACKET', 0),
(00000000020, 00000000062, 11, 'NEIGHBORHOOD BASEBALL JACKET', 0),
(00000000021, 00000000062, 10, 'NEIGHBORHOOD BASEBALL JACKET', 0),
(00000000022, 00000000074, 1, 'ASPESI GARMENT DYED MA-1 JACKET', 0),
(00000000022, 00000000061, 1, 'NEIGHBORHOOD BASEBALL JACKET', 0),
(00000000023, 00000000065, 2, 'A BATHING APE COLLEGE CREW SWEAT', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward` (
  `reward_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `user_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `coupon50` int(10) NOT NULL DEFAULT '0',
  `coupon100` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reward`
--

INSERT INTO `reward` (`reward_id`, `user_id`, `coupon50`, `coupon100`) VALUES
(00000000001, 00000000001, 11, 7),
(00000000002, 00000000002, 2, 1),
(00000000003, 00000000003, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `size_id` int(11) NOT NULL,
  `size` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`size_id`, `size`) VALUES
(1, 'X-Small'),
(2, 'Small'),
(3, 'Medium'),
(4, 'Large'),
(5, 'X-Large');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int(2) UNSIGNED ZEROFILL NOT NULL,
  `type` varchar(40) NOT NULL,
  `gender_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type`, `gender_id`) VALUES
(01, 'Coats & Jackets', 1),
(02, 'Sweats', 1),
(03, 'T-Shirts', 1),
(04, 'Shirts', 1),
(05, 'Coats & Jackets', 2),
(06, 'Sweats', 2),
(07, 'T-Shirts', 2),
(08, 'Skirts', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `nick_name` varchar(20) NOT NULL,
  `permission` varchar(10) CHARACTER SET dec8 COLLATE dec8_bin NOT NULL DEFAULT 'user',
  `email` varchar(40) NOT NULL COMMENT 'unique',
  `encrypted_password` varchar(80) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `token` varchar(20) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(8) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address_id` int(11) UNSIGNED ZEROFILL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `nick_name`, `permission`, `email`, `encrypted_password`, `salt`, `token`, `gender`, `phone`, `dob`, `address_id`, `created_at`, `update_at`) VALUES
(00000000001, 'Admin', 'admin', 'admin@eshopper.com', 'OlVJNGuL0CbzqANHdqmEuVF/jiA5NGVhMzZlODhj', '94ea36e88c', '4694074a2687c28a400e', 'Male', NULL, '2017-03-30', NULL, '2017-03-23 17:42:48', '0000-00-00 00:00:00'),
(00000000002, 'Martin', 'user', 'martin@cityu.com', 'BwbbmoA9j+bRAiDVpJpf1EvOqsliZDUyNWIwOTI0', 'bd525b0924', 'b56ce5a883a3aaf60e83', 'Male', NULL, NULL, NULL, '2017-03-27 14:21:11', '0000-00-00 00:00:00'),
(00000000003, 'Jack', 'user', 'jack@cityu.com', 'PgiuUbmqIikVG1UdkCCqbO2RqYkxNzczODE1MjBi', '177381520b', '2a6b1721d99b5a982b5f', '', NULL, NULL, NULL, '2017-04-12 04:43:22', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `clothes`
--
ALTER TABLE `clothes`
  ADD PRIMARY KEY (`clothes_id`);

--
-- Indexes for table `clothes_image`
--
ALTER TABLE `clothes_image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `clothes_review`
--
ALTER TABLE `clothes_review`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `reward`
--
ALTER TABLE `reward`
  ADD PRIMARY KEY (`reward_id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `clothes`
--
ALTER TABLE `clothes`
  MODIFY `clothes_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `clothes_image`
--
ALTER TABLE `clothes_image`
  MODIFY `image_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=540;
--
-- AUTO_INCREMENT for table `clothes_review`
--
ALTER TABLE `clothes_review`
  MODIFY `review_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `orderlist`
--
ALTER TABLE `orderlist`
  MODIFY `order_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `reward`
--
ALTER TABLE `reward`
  MODIFY `reward_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
