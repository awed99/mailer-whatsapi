
DROP TABLE IF EXISTS `app_setting`;
CREATE TABLE `app_setting` (
  `id` int NOT NULL,
  `tab_title` varchar(100) DEFAULT NULL,
  `tab_icon` text,
  `tab_description` text,
  `app_title` varchar(100) DEFAULT NULL,
  `app_logo` text,
  `primary_color` varchar(10) DEFAULT NULL,
  `secondary_color` varchar(10) DEFAULT NULL,
  `updated_by` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `app_setting`
--

INSERT INTO `app_setting` (`id`, `tab_title`, `tab_icon`, `tab_description`, `app_title`, `app_logo`, `primary_color`, `secondary_color`, `updated_by`) VALUES
(1, 'WhatsAPI.io', '/api/images/quatum-coder-1766475899296.png', 'WhatsAPI.io', 'WhatsAPI.io', '/api/images/quatum-coder-1766475899296.png', '#FF005E', '#FFCA00', '2025-12-23 14:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `cms_beranda`
--

DROP TABLE IF EXISTS `cms_beranda`;
CREATE TABLE `cms_beranda` (
  `id` int NOT NULL,
  `section_1_title` varchar(255) DEFAULT NULL,
  `section_1_subtitle` text,
  `section_1_url` text,
  `section_1_active` tinyint NOT NULL DEFAULT '1',
  `section_2_title` varchar(255) DEFAULT NULL,
  `section_2_subtitle` text,
  `section_2_json` text,
  `section_2_image` text,
  `section_2_url` text,
  `section_2_active` tinyint NOT NULL DEFAULT '1',
  `section_3_title` varchar(255) DEFAULT NULL,
  `section_3_subtitle` text,
  `section_3_json` text,
  `section_3_image` text,
  `section_3_url` varchar(255) DEFAULT NULL,
  `section_3_active` tinyint(1) NOT NULL DEFAULT '1',
  `section_4_title` varchar(255) DEFAULT NULL,
  `section_4_subtitle` text,
  `section_4_json` text,
  `section_4_image` text,
  `section_4_url` varchar(255) DEFAULT NULL,
  `section_4_active` tinyint(1) NOT NULL DEFAULT '1',
  `section_5_title` varchar(255) DEFAULT NULL,
  `section_5_subtitle` text,
  `section_5_json` text,
  `section_5_image` text,
  `section_5_url` varchar(255) DEFAULT NULL,
  `section_5_active` tinyint(1) NOT NULL DEFAULT '1',
  `section_6_title` varchar(255) DEFAULT NULL,
  `section_6_subtitle` text,
  `section_6_json` text,
  `section_6_image` text,
  `section_6_url` varchar(255) DEFAULT NULL,
  `section_6_active` tinyint(1) NOT NULL DEFAULT '1',
  `section_7_title` varchar(255) DEFAULT NULL,
  `section_7_subtitle` text,
  `section_7_url` text,
  `section_7_active` int NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `cms_beranda`
--

INSERT INTO `cms_beranda` (`id`, `section_1_title`, `section_1_subtitle`, `section_1_url`, `section_1_active`, `section_2_title`, `section_2_subtitle`, `section_2_json`, `section_2_image`, `section_2_url`, `section_2_active`, `section_3_title`, `section_3_subtitle`, `section_3_json`, `section_3_image`, `section_3_url`, `section_3_active`, `section_4_title`, `section_4_subtitle`, `section_4_json`, `section_4_image`, `section_4_url`, `section_4_active`, `section_5_title`, `section_5_subtitle`, `section_5_json`, `section_5_image`, `section_5_url`, `section_5_active`, `section_6_title`, `section_6_subtitle`, `section_6_json`, `section_6_image`, `section_6_url`, `section_6_active`, `section_7_title`, `section_7_subtitle`, `section_7_url`, `section_7_active`, `updated_at`) VALUES
(2, 'Quatum Coder Ai', 'Quantum Coder AI is a SaaS-based AI development platform that uses a token-based system, similar to modern AI coding tools like Windsurf. Each interaction, code generation, refactoring, debugging, and analysis consumes AI tokens, giving users full transparency and control over their usage and costs.\n\nThrough a single unified dashboard, developers can write, review, and optimize code across multiple programming languages and frameworks, generate APIs, fix bugs, and produce technical documentation with AI assistance. The platform is designed for speed, accuracy, and scalability, ensuring reliable performance for both individual developers and teams.\n\nWith flexible token packages, competitive pricing, and real-time usage tracking, Quantum Coder AI allows users to scale AI power based on their needs. Backed by a stable system and continuous support from the Quantum Coder AI team, users can focus on building better software faster while managing AI costs efficiently every day.', NULL, 1, 'Featured Partners', 'Our featured partners are trusted collaborators who have been working with Quantum Coder AI since October 2025 and continue to grow with us today. They actively leverage AI tokens to accelerate development workflows, optimize code quality, and scale AI-powered productivity across their teams.\n\nTogether with Quantum Coder AI, these partners expand their technical capabilities, adopt flexible token-based AI usage, and deliver faster, more reliable software solutions for users across various industries and regions.', '[\"/api/images/quatum-coder-1766066324954.png\",\"/api/images/quatum-coder-1766066320520.png\",\"/api/images/quatum-coder-1766066315055.png\"]', NULL, NULL, 1, 'Who Is This System For?', 'Quantum Coder AI is designed for individuals, teams, and organizations that want to harness AI-powered development tools through a flexible token-based system. It enables users to manage AI usage, productivity, and costs efficiently within a single, unified platform.\n\nThis system is ideal for solo developers, startups, software agencies, and enterprise teams—ranging from small development groups to large-scale engineering organizations. Whether you are building applications, maintaining existing systems, automating workflows, or scaling AI-assisted development, Quantum Coder AI provides structured AI access, transparent token management, and efficient collaboration to support faster delivery and sustainable growth.', '[{\"title\":\"Individual Developers\",\"subtitle\":\"Build, debug, and optimize code using AI tokens with full cost control.\",\"image\":\"/api/images/quatum-coder-1766065739963.png\"},{\"title\":\"Startups & Tech Teams\",\"subtitle\":\"Scale AI-powered development efficiently with flexible token usage.\",\"image\":\"/api/images/quatum-coder-1766065739963.png\"},{\"title\":\"Enterprises & Agencies\",\"subtitle\":\"Manage large-scale AI workloads with transparent token tracking and governance.\",\"image\":\"/api/images/quatum-coder-1766065739963.png\"}]', NULL, NULL, 1, 'Experience in Building an AI Token–Based Platform', 'Learn how we built an AI-powered development platform from the ground up—overcoming technical challenges, ensuring system stability, and scaling AI token usage efficiently. From designing transparent token accounting and real-time usage tracking to supporting advanced features such as code generation, refactoring, debugging, and AI-assisted workflows.\n\nDiscover how our innovation and long-term commitment over the past three years have helped thousands of users leverage AI more effectively, maintain cost control, and build software faster, more securely, and more reliably every day.', NULL, '/api/images/kasaku-1764046728606.png', NULL, 1, 'Empowering Businesses Through an Integrated AI Token Platform', 'Our journey began with a vision to make advanced AI technology accessible for developers and businesses of all sizes. By introducing a flexible, token-based AI system, we enable users to access powerful AI capabilities—ranging from code generation and debugging to workflow automation—through a fast, stable, and easy-to-use platform.\n\nThrough continuous innovation and a reliable AI infrastructure, Quantum Coder AI helps teams enhance productivity, scale development efforts, and unlock new opportunities for growth. Every milestone we achieve is driven by our commitment, ongoing innovation, and dedication to supporting our users as they grow and succeed alongside us.', '[{\"label\":\"Clients\",\"value\":\"100+\"},{\"label\":\"Packages\",\"value\":\"3+\"},{\"label\":\"AI Based\",\"value\":\"4+\"},{\"label\":\"Usages\",\"value\":\"100+\"}]', NULL, NULL, 1, 'Unlocking the Best AI Strategies in the Digital Era', 'Quantum Coder AI is the ideal platform to explore the latest insights in AI-powered development, emerging trends in token-based AI usage, and proven strategies to maximize productivity and efficiency. Here, users can learn from real success stories, discover new platform features and innovations, and understand how thoughtful AI adoption can drive sustainable growth.\n\nEnjoy a smarter, safer, and more streamlined AI experience within a single integrated platform. With transparent token management, real-time usage tracking, and instant AI responses, Quantum Coder AI ensures a stable system, fast processing, and a clean interface—so every AI-powered task is completed in seconds, without complexity.', NULL, NULL, NULL, 1, 'Complete & Fast AI Solutions in One Platform', 'Enjoy a smarter, more secure, and seamless AI experience. Quantum Coder AI is built to simplify your daily development tasks with instant AI responses, transparent token usage, and a reliable system—so you can focus on building without friction.', 'https://http://quatumcoder.ai/', 1, '2025-11-27 10:33:15');

-- --------------------------------------------------------

--
-- Table structure for table `cms_blogs`
--

DROP TABLE IF EXISTS `cms_blogs`;
CREATE TABLE `cms_blogs` (
  `id` int NOT NULL,
  `title` varchar(191) NOT NULL,
  `short_title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext NOT NULL,
  `related_blogs` longtext NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `author` varchar(191) DEFAULT 'Admin',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `cms_blogs`
--

INSERT INTO `cms_blogs` (`id`, `title`, `short_title`, `slug`, `content`, `related_blogs`, `image`, `date`, `author`, `updated_at`) VALUES
(7, 'sgsdfgfgdfdfd gfgdfgfgdgdfgdfgfdgf dgfdg dfg df', 'ds ffdsfdsfdsf sd ', 'sgsdfgfgdfdfd-gfgdfgfgdgdfgdfgfdgf-dgfdg-dfg-df', '<p><span style=\"\">dsfs ggsfgdf gd</span></p><p><span style=\"\">ggdxg</span></p><p><span style=\"\">d</span></p><p><span style=\"\">zdf gdxgdgdh</span></p>', '[]', '/api/images/kasaku-1763629599884.png', '2025-11-25 10:50:17.000', 'Admin', '2025-11-25 10:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `cms_blog_page`
--

DROP TABLE IF EXISTS `cms_blog_page`;
CREATE TABLE `cms_blog_page` (
  `id` int NOT NULL,
  `blog_title` varchar(255) DEFAULT NULL,
  `blog_subtitle` text,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `cms_blog_page`
--

INSERT INTO `cms_blog_page` (`id`, `blog_title`, `blog_subtitle`, `updated_at`) VALUES
(1, 'Blogs of <span>Quatum Coder</span>', 'Explore the latest insights, updates, and best practices from the Quatum Coder AI ecosystem—covering AI-assisted coding, token usage strategies, development workflows, and emerging trends to help you build smarter and faster.', '2025-12-19 11:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `cms_kontak`
--

DROP TABLE IF EXISTS `cms_kontak`;
CREATE TABLE `cms_kontak` (
  `id` int NOT NULL,
  `contact_title` varchar(255) DEFAULT NULL,
  `contact_subtitle` text,
  `contact_url` text,
  `contact_info_title` varchar(255) DEFAULT NULL,
  `contact_info_1_title` varchar(255) DEFAULT NULL,
  `contact_info_1_subtitle` text,
  `contact_info_1_icon` text,
  `contact_info_2_title` varchar(255) DEFAULT NULL,
  `contact_info_2_subtitle` text,
  `contact_info_2_icon` text,
  `contact_info_3_title` varchar(255) DEFAULT NULL,
  `contact_info_3_subtitle` text,
  `contact_info_3_icon` text,
  `contact_info_active` tinyint NOT NULL DEFAULT '1',
  `contact_location_title` varchar(255) DEFAULT NULL,
  `contact_location_subtitle` text,
  `contact_location_map_iframe_url` text,
  `contact_location_active` tinyint NOT NULL DEFAULT '1',
  `contact_cowork_title` varchar(255) DEFAULT NULL,
  `contact_cowork_subtitle` text,
  `contact_cowork_url` text,
  `contact_cowork_active` tinyint NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `cms_kontak`
--

INSERT INTO `cms_kontak` (`id`, `contact_title`, `contact_subtitle`, `contact_url`, `contact_info_title`, `contact_info_1_title`, `contact_info_1_subtitle`, `contact_info_1_icon`, `contact_info_2_title`, `contact_info_2_subtitle`, `contact_info_2_icon`, `contact_info_3_title`, `contact_info_3_subtitle`, `contact_info_3_icon`, `contact_info_active`, `contact_location_title`, `contact_location_subtitle`, `contact_location_map_iframe_url`, `contact_location_active`, `contact_cowork_title`, `contact_cowork_subtitle`, `contact_cowork_url`, `contact_cowork_active`, `updated_at`) VALUES
(1, 'Contact <span>WhatsAPI.io</span>', 'We’re here to help! Feel free to reach out to us for questions, partnerships, or support related to WhatsAPI.io and our token-based services.', NULL, 'Contact WhatsAPI.io', 'Fast Response', 'We respond to all messages you send as soon as possible, for the convenience of services and digital product transactions that are set on a tight schedule.', 'RocketLaunch', ' Stable & Fast System', '\nQuatum Coder AI is built with reliable infrastructure so that every process of purchasing, checking, and transacting digital products runs smoothly without any obstacles.', 'ConnectWithoutContact', 'Competitive Prices', 'We provide the best prices for all digital products with clear and affordable admin fees, ensuring partners can more easily achieve maximum profits.', 'AttachMoney', 1, 'Office of WhatsAPI.io', 'Our Office is in Grand Kota Bintang, Ruko Amsterdam, no 12-15, Bekasi Barat, City Bekasi, Province West Java, Indonesia', 'https://maps.google.com/maps?width=1152&height=400&hl=en&q=grand%20kota%20bintang&t=&z=15&ie=UTF8&iwloc=B&output=embed', 1, ' Ready to Work with WhatsAPI.io?', 'We\'re open to partnerships, collaborations, and digital business solutions. Let\'s build a better payments ecosystem together!', 'https://wa.me/628194100592', 1, '2025-12-23 16:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `cms_layanan`
--

DROP TABLE IF EXISTS `cms_layanan`;
CREATE TABLE `cms_layanan` (
  `id` int NOT NULL,
  `service_title` varchar(255) DEFAULT NULL,
  `service_subtitle` text,
  `service_url` text,
  `service_section_1_title` varchar(2555) DEFAULT NULL,
  `service_section_1_subtitle` text,
  `service_section_1_active` tinyint NOT NULL DEFAULT '1',
  `service_section_1a_title` varchar(255) DEFAULT NULL,
  `service_section_1a_subtitle` text,
  `service_section_1a_right_title` varchar(255) DEFAULT NULL,
  `service_section_1a_right_subtitle` text,
  `service_section_1a_active` tinyint NOT NULL DEFAULT '1',
  `service_section_1b_title` varchar(255) DEFAULT NULL,
  `service_section_1b_subtitle` text,
  `service_section_1b_right_title` varchar(255) DEFAULT NULL,
  `service_section_1b_right_subtitle` text,
  `service_section_1b_active` tinyint NOT NULL DEFAULT '1',
  `service_section_1c_title` varchar(255) DEFAULT NULL,
  `service_section_1c_subtitle` text,
  `service_section_1c_right_title` varchar(255) DEFAULT NULL,
  `service_section_1c_right_subtitle` text,
  `service_section_1c_active` tinyint NOT NULL DEFAULT '1',
  `service_section_2_title` varchar(255) DEFAULT NULL,
  `service_section_2_subtitle` text,
  `service_section_2_active` tinyint NOT NULL DEFAULT '1',
  `service_section_3_title` varchar(255) DEFAULT NULL,
  `service_section_3_subtitle` text,
  `service_section_3_active` tinyint NOT NULL DEFAULT '1',
  `service_section_4_title` varchar(255) DEFAULT NULL,
  `service_section_4_subtitle` text,
  `service_section_4_active` tinyint NOT NULL DEFAULT '1',
  `service_section_4_url` text,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `cms_layanan`
--

INSERT INTO `cms_layanan` (`id`, `service_title`, `service_subtitle`, `service_url`, `service_section_1_title`, `service_section_1_subtitle`, `service_section_1_active`, `service_section_1a_title`, `service_section_1a_subtitle`, `service_section_1a_right_title`, `service_section_1a_right_subtitle`, `service_section_1a_active`, `service_section_1b_title`, `service_section_1b_subtitle`, `service_section_1b_right_title`, `service_section_1b_right_subtitle`, `service_section_1b_active`, `service_section_1c_title`, `service_section_1c_subtitle`, `service_section_1c_right_title`, `service_section_1c_right_subtitle`, `service_section_1c_active`, `service_section_2_title`, `service_section_2_subtitle`, `service_section_2_active`, `service_section_3_title`, `service_section_3_subtitle`, `service_section_3_active`, `service_section_4_title`, `service_section_4_subtitle`, `service_section_4_active`, `service_section_4_url`, `updated_at`) VALUES
(2, 'Service of <span>Quatum Coder</span>', 'Quatum Coder AI delivers a wide range of AI-powered coding services that are fast, reliable, and always available—from everyday development tasks to advanced AI-assisted workflows. All services are designed to help developers and teams build, debug, and optimize software more efficiently within a single, practical, and trusted AI ecosystem powered by flexible token usage.', NULL, 'Explore Our AI Services', 'Quatum Coder AI provides a comprehensive and accessible suite of AI-powered coding services, covering everyday development needs as well as advanced, value-added capabilities. Every interaction is designed to be fast, secure, and frictionless—allowing users to experience a modern, efficient, and practical AI development workflow within a single integrated, token-based platform.', 1, 'Produk Prabayar', '<p><span style=\"\">Kasaku menyediakan berbagai layanan Produk Prabayar seperti pulsa, kuota internet, token PLN Prabayar, voucher game, dan beragam layanan digital lainnya. Semua transaksi diproses secara real-time dengan biaya admin yang sangat terjangkau, mulai dari hanya Rp 500, sehingga pengguna dapat menikmati pengalaman bertransaksi yang cepat, praktis, dan hemat.</span></p>', 'Biaya Admin Mulai', 'Rp 500', 1, 'Produk Pascabayar', '<p><span style=\"\">Kasaku mendukung berbagai layanan Produk Pascabayar seperti tagihan PLN Pascabayar, PDAM, Internet &amp; TV kabel, BPJS, dan beragam tagihan rutin lainnya. Dengan sistem pembayaran yang cepat dan aman, pengguna dapat melunasi tagihan bulanan tanpa antre, tanpa ribet, dan dengan biaya admin yang tetap hemat.</span></p>', 'Biaya Admin Mulai', 'Rp 500', 1, 'Produk Game', '<p><span style=\"\">Kasaku menyediakan berbagai produk top-up game terlengkap untuk judul populer seperti Mobile Legends, Free Fire, PUBG Mobile, Valorant, Genshin Impact, Honkai Series, hingga platform seperti Steam. Dengan proses cepat, harga kompetitif, dan biaya admin mulai dari Rp 500, pengguna dapat mengisi diamond, kredit, atau voucher game favorit mereka secara mudah dan instan.</span></p>', 'Biaya Admin Mulai', 'Rp 500', 1, 'Our Best Service', '<p><span style=\"\">Quatum Coder AI delivers a complete range of AI-powered coding services with reliable performance and responsive support for developers, teams, and organizations. Built on a transparent token-based system, our services are designed to ensure efficiency, scalability, and consistent quality—helping every user maximize productivity with confidence.</span></p>', 1, 'Join and Become a Quatum Coder AI Partner', 'Unlock greater opportunities by becoming an official Quatum Coder AI partner. Gain access to powerful AI coding services, flexible token-based pricing, a stable and scalable platform, and dedicated support designed to help you grow, integrate, and succeed faster in the AI-driven development ecosystem.', 1, 'Need More Information?', 'Contact our Customer Support team to get detailed information and assistance about Quatum Coder AI services and token-based solutions.', 1, 'https://wa.me/628194100592', '2025-11-25 09:53:28');

-- --------------------------------------------------------

--
-- Table structure for table `cms_tentang`
--

DROP TABLE IF EXISTS `cms_tentang`;
CREATE TABLE `cms_tentang` (
  `id` int NOT NULL,
  `about_title` varchar(255) DEFAULT NULL,
  `about_subtitle` text,
  `about_url` text,
  `about_visi_misi_title` varchar(255) DEFAULT NULL,
  `about_visi_title` varchar(255) DEFAULT NULL,
  `about_visi_subtitle` text,
  `about_visi_icon` text,
  `about_misi_title` varchar(255) DEFAULT NULL,
  `about_misi_subtitle` text,
  `about_misi_icon` text,
  `about_visi_misi_active` tinyint NOT NULL DEFAULT '1',
  `about_value_title` varchar(255) DEFAULT NULL,
  `about_value_1_title` varchar(255) DEFAULT NULL,
  `about_value_1_subtitle` text,
  `about_value_1_icon` text,
  `about_value_2_title` varchar(255) DEFAULT NULL,
  `about_value_2_subtitle` text,
  `about_value_2_icon` text,
  `about_value_3_title` varchar(255) DEFAULT NULL,
  `about_value_3_subtitle` text,
  `about_value_3_icon` text,
  `about_value_active` tinyint NOT NULL DEFAULT '1',
  `about_team_title` varchar(255) DEFAULT NULL,
  `about_team_subtitle` text,
  `about_team_json` text,
  `about_team_active` tinyint NOT NULL DEFAULT '1',
  `about_goals_title` varchar(255) DEFAULT NULL,
  `about_goals_subtitle` text,
  `about_goals_url` text,
  `about_goals_active` tinyint NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `cms_tentang`
--

INSERT INTO `cms_tentang` (`id`, `about_title`, `about_subtitle`, `about_url`, `about_visi_misi_title`, `about_visi_title`, `about_visi_subtitle`, `about_visi_icon`, `about_misi_title`, `about_misi_subtitle`, `about_misi_icon`, `about_visi_misi_active`, `about_value_title`, `about_value_1_title`, `about_value_1_subtitle`, `about_value_1_icon`, `about_value_2_title`, `about_value_2_subtitle`, `about_value_2_icon`, `about_value_3_title`, `about_value_3_subtitle`, `about_value_3_icon`, `about_value_active`, `about_team_title`, `about_team_subtitle`, `about_team_json`, `about_team_active`, `about_goals_title`, `about_goals_subtitle`, `about_goals_url`, `about_goals_active`, `updated_at`) VALUES
(1, 'About <span>Quatum Coder AI</span>', 'Quatum Coder AI is a secure and reliable AI-powered development platform that enables individuals and teams to access powerful coding assistance through a flexible token-based system—helping them build software faster, smarter, and more efficiently.', '#', 'Quatum Coder Goals', 'Our Vision', 'To become a leading AI coding companion that seamlessly integrates with tools like VS Code and modern IDEs, empowering developers worldwide to build high-quality software faster through transparent, token-based AI intelligence.', 'CurrencyExchange', 'Our Mission', 'To provide a reliable, token-based AI coding platform that assists developers in writing, reviewing, debugging, and optimizing code directly within their development workflows—while maintaining full control over usage, cost, and productivity.', 'CurrencyExchange', 1, 'Our Advantages', 'Token-Based AI Control', 'A transparent token system that lets you manage AI usage, monitor consumption in real time, and pay only for what you use—without hidden costs.', 'EscalatorWarning', 'Seamless IDE Integration', 'Designed to work smoothly with VS Code and modern development tools, enabling AI-assisted coding, debugging, and refactoring directly within your workflow.', 'Diversity3', 'Reliable & Scalable AI Platform', 'Built on a stable and scalable infrastructure to support individual developers, teams, and enterprises with fast responses and consistent performance.', 'GroupAdd', 1, 'Quatum Coder Ecosystem', 'Quatum Coder AI serves as the provider of the core AI platform and development infrastructure, enabling seamless access to token-based AI services. Developers and teams act as platform users who leverage AI tokens to generate code, debug, refactor, and optimize software within their workflows, while AI models and integrated services function as the technology providers delivering intelligent assistance.\n\nAll components within the Quatum Coder ecosystem work together in harmony to create an AI-powered development flow that is fast, secure, transparent, and scalable—ensuring efficient token usage, predictable costs, and sustainable value for every participant.', NULL, 1, 'Creating a Smart & Integrated Ecosystem', 'Quatum Coder AI builds an intelligent, token-powered development ecosystem that integrates seamlessly with tools like VS Code and modern IDEs—enabling developers to code, debug, and scale efficiently within one connected AI platform.', NULL, 1, '2025-12-18 21:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `img` text NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `parent_category` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `alt`, `img`, `title`, `category`, `parent_category`, `created_at`) VALUES
(1, 'kasaku-1763629599884.png', 'Kasaku', '/api/images/kasaku-1763629599884.png', NULL, NULL, NULL, '2025-11-20 16:06:39'),
(6, 'Test', NULL, '/folder.png', 'category', NULL, NULL, '2025-11-25 11:28:34'),
(7, 'kasaku-1764046100289.png', 'Kasaku', '/api/images/kasaku-1764046100289.png', NULL, 'Test', NULL, '2025-11-25 11:48:20'),
(9, 'kasaku-1764046306810.png', 'Kasaku', '/api/images/kasaku-1764046306810.png', NULL, 'Test', NULL, '2025-11-25 11:51:46'),
(10, 'Dewa', NULL, '/folder.png', 'category', NULL, NULL, '2025-11-25 11:58:40'),
(11, 'kasaku-1764046728606.png', 'Kasaku', '/api/images/kasaku-1764046728606.png', NULL, 'Dewa', NULL, '2025-11-25 11:58:48'),
(13, 'Clients', NULL, '/folder.png', 'category', NULL, NULL, '2025-11-27 10:41:38'),
(14, 'kasaku-1764214920728.png', 'Kasaku', '/api/images/kasaku-1764214920728.png', NULL, 'Clients', NULL, '2025-11-27 10:42:00'),
(15, 'kasaku-1764214928840.png', 'Kasaku', '/api/images/kasaku-1764214928840.png', NULL, 'Clients', NULL, '2025-11-27 10:42:08'),
(16, 'kasaku-1764214977448.png', 'Kasaku', '/api/images/kasaku-1764214977448.png', NULL, 'Clients', NULL, '2025-11-27 10:42:57'),
(17, 'kasaku-1764215110930.png', 'Kasaku', '/api/images/kasaku-1764215110930.png', NULL, 'Clients', NULL, '2025-11-27 10:45:10'),
(18, 'kasaku-1764215180568.png', 'Kasaku', '/api/images/kasaku-1764215180568.png', NULL, 'Dewa', NULL, '2025-11-27 10:46:20'),
(21, 'kasaku-1764215556041.png', 'Kasaku', '/api/images/kasaku-1764215556041.png', NULL, 'Dewa', NULL, '2025-11-27 10:52:36'),
(25, 'kasaku-1764215681251.png', 'Kasaku', '/api/images/kasaku-1764215681251.png', NULL, 'Test', NULL, '2025-11-27 10:54:41'),
(27, 'kasaku-1764215955220.png', 'Kasaku', '/api/images/kasaku-1764215955220.png', NULL, NULL, NULL, '2025-11-27 10:59:15'),
(28, 'kasaku-1764215979506.png', 'Kasaku', '/api/images/kasaku-1764215979506.png', NULL, NULL, NULL, '2025-11-27 10:59:39'),
(29, 'Quatum Coder', NULL, '/folder.png', 'category', NULL, NULL, '2025-12-18 20:48:44'),
(30, 'quatum-coder-1766065735148.png', 'Quatum Coder', '/api/images/quatum-coder-1766065735148.png', NULL, 'Quatum Coder', NULL, '2025-12-18 20:48:55'),
(31, 'quatum-coder-1766065739963.png', 'Quatum Coder', '/api/images/quatum-coder-1766065739963.png', NULL, 'Quatum Coder', NULL, '2025-12-18 20:48:59'),
(32, 'quatum-coder-1766066315055.png', 'Quatum Coder', '/api/images/quatum-coder-1766066315055.png', NULL, 'Clients', NULL, '2025-12-18 20:58:35'),
(33, 'quatum-coder-1766066320520.png', 'Quatum Coder', '/api/images/quatum-coder-1766066320520.png', NULL, 'Clients', NULL, '2025-12-18 20:58:40'),
(34, 'quatum-coder-1766066324954.png', 'Quatum Coder', '/api/images/quatum-coder-1766066324954.png', NULL, 'Clients', NULL, '2025-12-18 20:58:44'),
(35, 'WhastAPI', NULL, '/folder.png', 'category', NULL, NULL, '2025-12-23 14:44:48'),
(36, 'quatum-coder-1766475894762.png', 'Quatum Coder', '/api/images/quatum-coder-1766475894762.png', NULL, 'WhastAPI', NULL, '2025-12-23 14:44:54'),
(37, 'quatum-coder-1766475899296.png', 'Quatum Coder', '/api/images/quatum-coder-1766475899296.png', NULL, 'WhastAPI', NULL, '2025-12-23 14:44:59'),
(38, 'quatum-coder-1766475904380.png', 'Quatum Coder', '/api/images/quatum-coder-1766475904380.png', NULL, 'WhastAPI', NULL, '2025-12-23 14:45:04');

-- --------------------------------------------------------

--
-- Table structure for table `komponen_banner`
--

DROP TABLE IF EXISTS `komponen_banner`;
CREATE TABLE `komponen_banner` (
  `id` int NOT NULL,
  `banner_title` varchar(255) DEFAULT NULL,
  `banner_subtitle` text,
  `banner_url` text,
  `banner_image` text,
  `banner_active` tinyint NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `komponen_banner`
--

INSERT INTO `komponen_banner` (`id`, `banner_title`, `banner_subtitle`, `banner_url`, `banner_image`, `banner_active`, `updated_at`) VALUES
(1, 'One Platform. Unlimited AI Potential', 'Scale your development with token-based AI solutions.', '#', '/api/images/kasaku-1764215556041.png', 1, '2025-12-18 21:10:11'),
(2, 'Smarter Coding, Transparent AI Costs', 'Pay only for what you use with flexible AI tokens.', '#', '/api/images/kasaku-1764215955220.png', 1, '2025-12-18 21:09:51'),
(9, 'Build Faster with AI Tokens', 'Start using AI-powered coding with full cost control today.', '', '/api/images/kasaku-1764215979506.png', 1, '2025-12-18 21:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `medsos`
--

DROP TABLE IF EXISTS `medsos`;
CREATE TABLE `medsos` (
  `id` int UNSIGNED NOT NULL,
  `playstore_url` text,
  `appstore_url` text,
  `facebook_url` text,
  `twitter_url` text,
  `youtube_url` text,
  `instagram_url` text,
  `linkedin_url` text,
  `telegram_url` text,
  `tiktok_url` text,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--
-- Dumping data for table `medsos`
--

INSERT INTO `medsos` (`id`, `playstore_url`, `appstore_url`, `facebook_url`, `twitter_url`, `youtube_url`, `instagram_url`, `linkedin_url`, `telegram_url`, `tiktok_url`, `updated_at`) VALUES
(1, 'https://playstore.com', 'https://appstore.com', 'https://facebook.com', 'https://x.com', 'https://youtube.com', 'https://instagram.com', NULL, 'https://t.me/dewadanu1005', NULL, '2025-12-19 12:06:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `desc` text,
  `json_desc` text,
  `category` varchar(15) NOT NULL DEFAULT 'monthly',
  `price` float NOT NULL DEFAULT '0',
  `quota` int NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1'
);

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `desc`, `json_desc`, `category`, `price`, `quota`, `updated_at`, `status`) VALUES
(1, 'Lite', 'For individuals and small teams trying out for an unlimited period.', '[\"Limited Send Messages\",\"Limited Send Images\",\"Limited Send Documents\",\"API\",\"1 Device\"]', 'monthly', 10, 1, '2025-12-24 12:13:22', 1),
(2, 'Basic', 'For individual account executives who want increased productivity.', '[\"Unlimited Send Messages\",\"Limited Send Images\",\"Limited Send Documents\",\"API\",\"Webhook\",\"3 Device\"]', 'monthly', 30, 3, '2025-12-24 12:15:16', 1),
(3, 'Plus', 'For medium and large sales organizations with advanced needs.', '[\"Unlimited Send Messages\",\"Unlimited Send Images\",\"Unlimited Send Documents\",\"Support Send Message to User or Group\",\"API\",\"Webhook\",\"Unlimited Device\"]', 'monthly', 50, -1, '2025-12-24 12:15:16', 1),
(4, 'Lite', 'For individuals and small teams trying out for an unlimited period.', '[\"Limited Send Messages\",\"Limited Send Images\",\"Limited Send Documents\",\"API\",\"1 Device\"]', 'yearly', 100, 1, '2025-12-24 12:15:16', 1),
(5, 'Basic', 'For individual account executives who want increased productivity.', '[\"Unlimited Send Messages\",\"Limited Send Images\",\"Limited Send Documents\",\"API\",\"Webhook\",\"3 Device\"]', 'yearly', 300, 3, '2025-12-24 12:15:16', 1),
(6, 'Plus', 'For medium and large sales organizations with advanced needs.', '[\"Unlimited Send Messages\",\"Unlimited Send Images\",\"Unlimited Send Documents\",\"Support Send Message to User or Group\",\"API\",\"Webhook\",\"Unlimited Device\"]', 'yearly', 500, -1, '2025-12-24 12:15:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE `subscription` (
  `id` int NOT NULL,
  `id_user` int NOT NULL DEFAULT '0',
  `id_product` int NOT NULL DEFAULT '0',
  `product_name` varchar(255) DEFAULT NULL,
  `product_desc` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint NOT NULL,
  `subscription_id` int NOT NULL,
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  `trx_id` varchar(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `payment_link` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(10) NOT NULL DEFAULT 'IDR',
  `pg_name` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_channel` varchar(50) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending,1=paid,2=failed,3=expired,4=cancel',
  `expired_at` datetime DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `pg_response` json DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `wa_number` bigint DEFAULT NULL,
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `quota` int NOT NULL DEFAULT '0',
  `smtp_name` varchar(100) DEFAULT NULL,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_port` int DEFAULT NULL,
  `smtp_user` varchar(255) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_tls` enum('tls','ssl','none') DEFAULT NULL,
  `smtp_dest` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `wa_number`, `api_key`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `quota`, `smtp_name`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_tls`, `smtp_dest`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 811234342553, NULL, 'dewadanubrata@gmail.com', 'super_admin', NULL, 'U2FsdGVkX1/YQWKBFbmDXp1ysYQQLCOh10/L28YQ1YQ=', 'U2FsdGVkX196mXneuCLbuOIkS7/r0VNYljyfLVkU45I=', 0, 'WhatsAPI.io', 'smtp.gmail.com', 587, 'tesakun31@gmail.com', 'juxyhlmrrdtcvvzl', 'tls', 'tesakun29@gmail.com', '2025-01-15 00:58:28', '2025-12-23 08:15:57'),
(5, 'Admin1', NULL, NULL, 'admin@kasaku.local', 'super_admin', '2025-11-20 09:44:40', 'U2FsdGVkX19qUK7MBQP7n94w0AtJOApcsugi6Jpb5++FUAWyiy0m6SuajrjIbPpC', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-20 09:44:40', '2025-11-20 09:44:40'),
(7, 'Dewa Danu', 62834536345, 'bf7dfb07eb9b1bb244b4ee40b3776dab2f9624d4c2a11351', 'tesakun29@gmail.com', 'user', '2025-12-24 06:47:12', 'U2FsdGVkX19JySas5yZF5RCEh+kfeXwvrTx0GHSWQH8=', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-24 06:47:12', '2025-12-24 06:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `wa_devices`
--

DROP TABLE IF EXISTS `wa_devices`;
CREATE TABLE `wa_devices` (
  `id` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `jid` varchar(64) DEFAULT NULL,
  `auth_state` longtext,
  `device_status` tinyint NOT NULL DEFAULT '1',
  `qr` longtext,
  `qr_updated_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `last_error` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--
-- Dumping data for table `wa_devices`
--

INSERT INTO `wa_devices` (`id`, `id_user`, `device_name`, `phone`, `jid`, `auth_state`, `device_status`, `qr`, `qr_updated_at`, `last_seen_at`, `last_error`, `created_at`, `updated_at`) VALUES
(1, 7, 'Dewa', NULL, NULL, '{\"creds\":{\"noiseKey\":{\"private\":{\"type\":\"Buffer\",\"data\":\"GCEE8KZRB3YxssxpNAiTZK0JHr+PdlUmZxq+2GfXM3o=\"},\"public\":{\"type\":\"Buffer\",\"data\":\"wo3eHhPdxEwItSCFswrOz+ya4M1vQIiijZpGbrWBgXE=\"}},\"pairingEphemeralKeyPair\":{\"private\":{\"type\":\"Buffer\",\"data\":\"WDppzVlHdHhf//cQVv/JWBCiOZ2j/RisfaYBfScafHU=\"},\"public\":{\"type\":\"Buffer\",\"data\":\"5L/NPAxuohP6onpVa5ciVY/v1DpEdE4wedE+K2/hMxE=\"}},\"signedIdentityKey\":{\"private\":{\"type\":\"Buffer\",\"data\":\"iL4zq2tcEY031Fn8nLsyCXH/X1PXii/VG30ZM7kftFQ=\"},\"public\":{\"type\":\"Buffer\",\"data\":\"QIXvKUjXFEwVJx6hGzOi0A04NARyxbJCYSYtXOtfCSU=\"}},\"signedPreKey\":{\"keyPair\":{\"private\":{\"type\":\"Buffer\",\"data\":\"kFP1HZ/jI69LxfeuCf5qDEnekfkkRBYiwXzsMuiFREo=\"},\"public\":{\"type\":\"Buffer\",\"data\":\"Kfftj0mBJzm5FqNKG0Uz4EWCGln0O4S+0qAQw/w0fhk=\"}},\"signature\":{\"type\":\"Buffer\",\"data\":\"p1uBYrWddpWFonUMCKRF8DzFLPu5gd9Z4Jap3ffeTrsErZ62P0Sw162XagjV54QCH27LXuT28K3JAZ8tJHjhgQ==\"},\"keyId\":1},\"registrationId\":87,\"advSecretKey\":\"Bq/fruplpfweFup791uht4TmcSNTTmtC0dMCGfU23XI=\",\"processedHistoryMessages\":[],\"nextPreKeyId\":1,\"firstUnuploadedPreKeyId\":1,\"accountSyncCounter\":0,\"accountSettings\":{\"unarchiveChats\":false},\"registered\":false,\"account\":{\"details\":\"CN/VnYsBEJH+rsoGGAIgACgA\",\"accountSignatureKey\":\"Y23dT9Meroid5gsz+u8nduvP1N0B3hYThAQj9l2641o=\",\"accountSignature\":\"N68ihuewj+cEs6SD/BUK/WMESFCYrDe2vPMXFebdi1qF6//YfIJvNdijRMbYFw1uxmaopk+1/oc0NmPuKeFrBw==\",\"deviceSignature\":\"mr+FpcO/N6IFWFeMYc/785mRvbIH1jHXoV76DH5zs6mBP13YkGxSF+bPGwzpWGr2/JGbxgjWOZ/qQV7gjx37hg==\"},\"me\":{\"id\":\"6285881628286:34@s.whatsapp.net\",\"lid\":\"203929442844694:34@lid\"},\"signalIdentities\":[{\"identifier\":{\"name\":\"203929442844694:34@lid\",\"deviceId\":0},\"identifierKey\":{\"type\":\"Buffer\",\"data\":\"BWNt3U/THq6IneYLM/rvJ3brz9TdAd4WE4QEI/ZduuNa\"}}],\"platform\":\"android\"},\"keys\":{}}', 4, '2@Hq+Tdy6ASzH7nQfiROd9OrSZ1dvxPnGjuRgktoGrW68pVpyy6YWrh8k68pwk1tKS886Iuoul4+UZHNYVVuk6fDWmR+Q3W/SgY5M=,eZIoA6aHHJfF618RU0ZOn0nydzP1CF2g1J+dIEicSXI=,pX6GhbX7PTyB+g0JF+eYRaosValU6It8WvnzDmo8Ei4=,37QGYgplYPO6JiujDRt5YRaB/72G4cM09iizQH7x9vE=', '2025-12-24 17:23:46', '2025-12-24 17:24:06', 'QR refs attempts ended', '2025-12-24 17:22:31', '2025-12-24 17:24:05'),
(4, 7, 'Dewas', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2025-12-24 17:33:19', '2025-12-24 17:33:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_setting`
--
ALTER TABLE `app_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_beranda`
--
ALTER TABLE `cms_beranda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_blogs`
--
ALTER TABLE `cms_blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_slug_key` (`slug`);

--
-- Indexes for table `cms_blog_page`
--
ALTER TABLE `cms_blog_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_kontak`
--
ALTER TABLE `cms_kontak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_layanan`
--
ALTER TABLE `cms_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_tentang`
--
ALTER TABLE `cms_tentang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komponen_banner`
--
ALTER TABLE `komponen_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medsos`
--
ALTER TABLE `medsos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trx_id` (`trx_id`),
  ADD KEY `idx_subscription` (`subscription_id`),
  ADD KEY `idx_trx` (`trx_id`),
  ADD KEY `idx_order` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `wa_number` (`wa_number`),
  ADD KEY `sidobe_api_key` (`api_key`);

--
-- Indexes for table `wa_devices`
--
ALTER TABLE `wa_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_setting`
--
ALTER TABLE `app_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_beranda`
--
ALTER TABLE `cms_beranda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_blogs`
--
ALTER TABLE `cms_blogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cms_blog_page`
--
ALTER TABLE `cms_blog_page`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_kontak`
--
ALTER TABLE `cms_kontak`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_layanan`
--
ALTER TABLE `cms_layanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_tentang`
--
ALTER TABLE `cms_tentang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `komponen_banner`
--
ALTER TABLE `komponen_banner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `medsos`
--
ALTER TABLE `medsos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wa_devices`
--
ALTER TABLE `wa_devices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `subscription` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`) ON DELETE CASCADE;
