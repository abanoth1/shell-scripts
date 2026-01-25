

# Shell Scripting Practice

This repository is where I practice and improve my **shell scripting and Linux automation** skills. I started this repo to get comfortable with Bash and to build small scripts that solve real, day-to-day DevOps problems. Over time, I added monitoring scripts, cron jobs, and email alerts to better understand how production systems behave.

This is not about fancy code—it’s about **learning by doing**, breaking things, fixing them, and improving step by step.

## Why This Repository Exists

I wanted a single place to:

* Practice Bash scripting consistently
* Store all my learning scripts in one place
* Track my progress over time
* Build a strong foundation for DevOps and system automation

This repo allows me to experiment freely and gradually improve without overcomplicating things.
## What This Repository Covers

### Core Shell Scripting Concepts

* Variables and environment variables
* Special variables
* Conditions (`if`, `elif`, `else`)
* Loops (`for`, `while`)
* Functions
* Logging
* Error handling
* Basic package installations

---

### Practical Scripts I’ve Written

* `set.sh` – Working with variables and environment values
* `delete-old-logs.sh` – Automatically cleans up old log files
* `logs.sh` – Creates and manages log files
* `backup.sh` – Simple backup automation script
* `disk-usage.sh` – Monitors disk usage
* `while-loop.sh` – Loop practice
* Monitoring scripts for system health
* Crontab-based automation scripts
* Email alert scripts for disk usage
* Other small scripts for testing and learning

---

## Folder Structure

```
/scripts
 ├── variables.sh
 ├── env-variables.sh
 ├── special-variables.sh
 ├── conditions.sh
 ├── loops.sh
 ├── functions.sh
 ├── set.sh
 ├── delete-old-logs.sh
 ├── backup.sh
 ├── disk-usage.sh
 ├── while-loop.sh
 ├── monitoring-scripts/
 └── cron-scripts/
```

---

## What I’ve Learned So Far

* Writing clean and simple shell scripts
* Using conditions and loops in real-world tasks
* Automating backups and log cleanup
* Breaking down problems step by step
* Using functions to reduce duplicate code
* Scheduling tasks using `crontab`
* Adding basic error handling
* Sending email alerts from scripts
* Monitoring system usage using Bash tools

---

## How to Run Any Script

1. Give execute permission:

   ```bash
   chmod +x script-name.sh
   ```
2. Run the script:

   ```bash
   ./script-name.sh
   ```

## A Small Note

This repository is mainly for my learning and practice. I’ll continue updating it as I explore more Linux, DevOps, and automation concepts.
