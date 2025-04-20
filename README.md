Canvas # AWS S3 Backup Automation System

Automated backup system that creates compressed archives and uploads to AWS S3.

## Features
- ✅ Compressed tar.gz backups with timestamp
- 🔐 AWS S3 integration
- 📊 Detailed logging system
- 🚫 Error handling and validation
- ⏰ Cron job scheduling

## Tech Stack
- **Bash scripting**
- AWS CLI
- Linux cron
- Tar archiving

## Usage
```bash
# Clone repository
git clone https://github.com/Mahmoudbeshay/aws-s3-backup-system.git

# Make script executable
chmod +x src/s3-backup.sh

# Run backup
./src/s3-backup.sh /path/to/backup
```

