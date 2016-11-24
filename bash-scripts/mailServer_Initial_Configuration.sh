#!/bin/bash

# Author : Chirag Jain
# Copyright (c) Amaeka
# Script to setup mailServer
# For Redhat, Cent0S and Fedora distros

  sh basicSetup.sh

  # Component required :: https://www.linode.com/docs/email/running-a-mail-server
  # MTA's - Postfix (Recommended), Exim, Qmail, Zimbra, Sendmail, Courier Mail
  # MDA's - Dovecot (R), Cyrus MDA(*1), Postfix / Sendmail MDA, Procmail, deliver
  # POP3/IMAP server: Dovecot(R), Citadel, Courier, Zimbra (*1), DBMail, Xmail
  # DB server: MySQL/Postgre SQL (Manage domains, email id, aliases, user details)
  # webmail
  # spam filtering
  # virus scanning
  # mailing list organizers
  # Local Mail Client (user) : outlook, thunderbird, Apple Mail

  # (1) mbox: All email in 1 file (2) Maildir: Each email-separate file (3) DBMail
  # Cyrus 1inAll (*1) modern,secure designed wheres users do not log in directly

    setup_SSL_Certificate
    setup_Software
    setup_DNS_Records
      # Lower TTL
      setup_MX_Records
      setup_SPF_Records
      setup_Reverse_DNS
    setup_SPAM_Virus_Protection
      # Amavis, Clam Antivirus, SpamAssassin
    setup_Mail_Clients
      # Outlook, thunderbird
    setup_Webmail
      # Citadel, Horde, RoundCube, SquirrelMail, Zimbra

    function setup_SSL_Certificate() {
        install_Package openssl
        mkdir /etc/ssl/localcerts
    #   Creating a Self-Signed Certificate

        openssl req -new -x509 -sha256 -days 365 -nodes -out /etc/ssl/localcerts/example.com.crt -keyout /etc/ssl/localcerts/example.com.key

        chmod 600 /etc/ssl/localcerts/apache*
        x
    }

    function install_Package() {
      if rpm -q $1 &> /dev/null ; then
        echo "$1 already exist"
      else
        yum install $1 -y
    }


    setup_MX_Records() {
      # Tells Internet where to send your domain’s email
      example.com         86400   MX      10      example.com
      amaeka.com          86400   MX      10      23.94.63.198
      mail.amaeka.com     86400   MX      10      23.94.63.198
    }

    setup_SPF_Records() {
      domain.com     86400   TXT    "v=spf1 a ~all"
      # IP of all the mail servers from which you send email. Eg:
      amaeka.com     86400   TXT    "v=spf1 mx a ipv4:IP a:amaeka.kayako.com ~all"
      # More info : http://www.openspf.org/SPF_Record_Syntax
    }

    setup_Reverse_DNS() {
      # Reverse DNS for your mail server must match the hostname of your Linode
    }
