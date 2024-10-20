# Inception Project

## Table of Contents
1. [Introduction](#introduction)
2. [Project Architecture](#project-architecture)
3. [Containers Overview](#containers-overview)
4. [Installation and Setup](#installation-and-setup)
5. [Configuration Details](#configuration-details)
6. [Volumes and Networks](#volumes-and-networks)
7. [Bonus Features](#bonus-features)
8. [Monitoring with cAdvisor](#monitoring-with-cadvisor)
9. [License](#license)
10. [Contact](#contact)

---

## Introduction

The **Inception** project is an advanced system administration exercise aimed at simulating a real-world multi-service infrastructure using **Docker**. It demonstrates how various services (web server, database, cache, FTP, etc.) can work together in isolated Docker containers to create a production-ready environment.

This project leverages Docker Compose for orchestration, creating custom Docker images from scratch for each service. The containerized architecture includes:
- **Web server (Nginx)**
- **Database (MariaDB)**
- **Content management system (WordPress)**
- **Caching service (Redis)**
- **Database management tool (Adminer)**
- **File Transfer Protocol (FTP)**
- **Container monitoring tool (cAdvisor)**

---

## Project Architecture

The architecture consists of interdependent Docker containers communicating over a custom bridge network. Here is a high-level overview of the system design:

         +-------------+         +------------+         +--------------+
         |  Nginx (SSL) | <--->   |  WordPress | <--->   |  MariaDB      |
         +-------------+         +------------+         +--------------+
                |                       |                      |
                v                       v                      v
          +------------+         +-----------+         +--------------+
          |  FTP Server|         |  Redis    |         |  Adminer      |
          +------------+         +-----------+         +--------------+
                                                       |   cAdvisor    |
                                                       +--------------+

### Key Features
- **Nginx** serves as the web server, handling static files and reverse proxying WordPress with SSL/TLS support.
- **WordPress** is the CMS backed by a **MariaDB** database for dynamic content.
- **Redis** adds caching to improve WordPress performance.
- **Adminer** provides database management for MariaDB.
- **FTP Server** allows file uploads to WordPress.
- **cAdvisor** monitors resource usage for each container.

---

## Containers Overview

### 1. **Nginx (Web Server)**
- **Purpose**: Handles HTTPS requests and serves static content.
- **SSL Configuration**: Uses a self-signed SSL certificate.
- **Reverse Proxy**: Proxies traffic to the WordPress container.
- **Build Context**: `requirements/nginx`
- **Ports**: 
  - `443` (HTTPS)

### 2. **MariaDB (Database)**
- **Purpose**: Provides a relational database for WordPress.
- **Persistent Storage**: Utilizes a mounted volume to store database files.
- **Build Context**: `requirements/mariadb`
- **Ports**: 
  - Exposed internally, no external port is needed.
  
### 3. **WordPress (CMS)**
- **Purpose**: Dynamic website and CMS interacting with MariaDB.
- **Cache**: Integrated with Redis for object caching.
- **Build Context**: `requirements/wordpress`
- **Ports**: 
  - Exposed via Nginx (no direct port).

### 4. **Redis (Cache)**
- **Purpose**: Provides in-memory caching to WordPress to improve performance.
- **Build Context**: `requirements/bonus/redis`
- **Ports**:
  - `6379` (Redis default port)

### 5. **FTP Server**
- **Purpose**: Allows users to upload files to the WordPress directory via FTP.
- **Passive Mode**: Configured to use ports 21100-21110.
- **Build Context**: `requirements/bonus/ftp_server`
- **Ports**:
  - `21` (FTP command port)
  - `21100-21110` (FTP passive data ports)

### 6. **Adminer (Database Management)**
- **Purpose**: A lightweight web-based interface to manage MariaDB databases.
- **Build Context**: `requirements/bonus/adminer`
- **Ports**:
  - `9000` (Adminer web interface)

### 7. **cAdvisor (Monitoring)**
- **Purpose**: Provides real-time monitoring of Docker container resource usage (CPU, memory, disk I/O, etc.).
- **Build Context**: `requirements/bonus/cAdvisor`
- **Ports**:
  - `8080` (cAdvisor web interface)

### 8. **Static Website (Bonus)**
- **Purpose**: A bonus static website hosted by Nginx.
- **Build Context**: `requirements/bonus/website`
- **Ports**:
  - `3000` (Web server for static content)

---

## Installation and Setup

### 1. **Clone the Repository**
   ```bash
   git clone [https://github.com/yourusername/inception.git](https://github.com/fredrukundo/Inception.git)
   cd inception
   ```

### 2. **Build and start the containers**
    ```bash
    make
    ```
