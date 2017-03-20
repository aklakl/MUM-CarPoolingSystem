-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-03-20 17:10:20
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carpoolingdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `commentid` int(20) UNSIGNED NOT NULL,
  `userid` int(20) UNSIGNED NOT NULL,
  `postid` int(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `likes`
--

CREATE TABLE `likes` (
  `likeid` int(20) UNSIGNED NOT NULL,
  `userid` int(20) UNSIGNED NOT NULL,
  `postid` int(20) UNSIGNED NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE `posts` (
  `postid` int(20) UNSIGNED NOT NULL,
  `userid` int(20) UNSIGNED NOT NULL,
  `post` text COLLATE utf8_bin NOT NULL,
  `posttype` int(1) UNSIGNED NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `userid` int(20) UNSIGNED NOT NULL,
  `fullname` varchar(100) COLLATE utf8_bin NOT NULL,
  `gender` int(1) UNSIGNED NOT NULL,
  `state` varchar(50) COLLATE utf8_bin NOT NULL,
  `city` varchar(50) COLLATE utf8_bin NOT NULL,
  `street` varchar(50) COLLATE utf8_bin NOT NULL,
  `zipcode` int(5) UNSIGNED NOT NULL,
  `birthyear` int(4) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`userid`, `fullname`, `gender`, `state`, `city`, `street`, `zipcode`, `birthyear`, `email`, `password`, `datecreated`, `dateupdated`) VALUES
(1, 'aa', 0, 'aa', 'aa', '21', 21, 1998, 'aa', 'aa', '2017-03-18 16:32:11', '2017-03-18 16:32:11'),
(2, 'bb', 1, 'bb', 'bb', '23', 23, 1991, 'bb', 'bb', '2017-03-18 16:32:41', '2017-03-18 16:32:41'),
(3, 'cc', 1, 'cc', 'cc', '26', 24, 1992, 'cc', 'cc', '2017-03-18 16:33:11', '2017-03-18 16:33:11'),
(4, 'dd', 0, 'dd', 'dd', '59', 12, 1999, 'dd', 'dd', '2017-03-18 16:33:44', '2017-03-18 16:33:44'),
(5, 'ee', 1, 'ee', 'ee', '51', 12, 1980, 'ee', 'ee', '2017-03-18 16:34:18', '2017-03-18 16:34:18'),
(12, 'aa', 0, 'aa', 'aa', '21', 0, 0, 'aa', 'aa', '2017-03-19 16:02:50', '2017-03-19 16:02:50'),
(13, 'aa', 0, 'aa', 'aa', '21', 0, 0, 'aa', 'aa', '2017-03-19 16:03:59', '2017-03-19 16:03:59'),
(14, 'aa', 0, 'aa', 'aa', '21', 0, 0, 'aa', 'aa', '2017-03-19 16:17:26', '2017-03-19 16:17:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likeid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `commentid` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `likes`
--
ALTER TABLE `likes`
  MODIFY `likeid` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
