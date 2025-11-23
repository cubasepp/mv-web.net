---
layout: post
title:  "Self-Hosting: Nextcloud 💾 & Blog 🌥️ via Portainer 🐳 "
category: [home-sever, raspberry-pi, docker]
tags: [raspberry-pi, home-server, docker]
authors: [mivo]
---

## 🧱 NVMe Setup

Vorab habe ich eine weitere Partition **/data** angelegt, um meine Daten sauber zu trennen.
Dort liegen jetzt alle wichtigen Dateien und das Setup ist damit übersichtlich strukturiert.

## 🐳 Docker-Umgebung mit Portainer

Die gesamte Serververwaltung läuft bei mir über **Portainer**, was das Management der Container extrem bequem macht.

### Aktuell laufende Docker-Images

- **Nginx Proxy Manager**
- **Nextcloud**
- **mv-web.net**

Damit deckt das Setup alles ab, was ich aktuell brauche: mein Blog, meine private Cloud, ein Reverse-Proxy mit Zertifikaten und die Verwaltung über ein komfortables Web-UI.

---

## 🌐 Nginx Proxy Manager: Drei Hosts, sauber abgesichert

Im Proxy Manager habe ich derzeit drei Hosts konfiguriert:

- **cloud**
- **app**
- **www**

Alle drei laufen mit einem gültigen **Let’s Encrypt Zertifikat** und verweisen korrekt auf ihre jeweiligen Docker-Container.

Damit ist mein Setup vollständig HTTPS-fähig und auch von außen sicher erreichbar.

---

## 🔧 DNS-Konfiguration bei Hetzner: IPv6, myFritz & der Stolperstein

Der Domain-Teil war… sagen wir… nicht ganz so straightforward wie erwartet.

Ich nutze Hetzner DNS und habe meinen myFritz-Dienst entsprechend eingebunden.
Was auf simpel klingt, hat sich kniffliger herausgestellt – **wegen IPv6**.

Durch die **Privacy Extensions** von IPv6 änderte der Raspberry Pi regelmäßig seine IPv6-Adresse. Nach einigen Tagen war der Server plötzlich nicht mehr erreichbar – und die Fehlersuche war entsprechend nervig.

**Lösung:**
Ich habe den Raspberry Pi neu konfiguriert und dafür gesorgt, dass er eine **stabile IPv6-Adresse** behält. Seitdem läuft der Zugriff von außen problemlos.

---

## 🔗 Raspberry Pi Connect

Zusätzlich nutze ich **<https://connect.raspberrypi.com/>**.
Damit kann ich den Pi remote erreichen, selbst wenn gerade kein direkter Zugriff über DynDNS funktioniert oder ich debuggen muss. Sehr praktisches Feature!

---

## ⚙️ Stabilität & Performance

Was mich wirklich überrascht hat: **Das Setup ist extrem stabil.**

Nextcloud läuft performant, die Docker-Container greifen sauber ineinander, und auch der Proxy Manager verrichtet seinen Dienst zuverlässig.
Für ein Setup, das auf so wenig Hardware basiert, bin ich echt begeistert.

---

## 💾 Nächster Schritt: Backups

Noch ein großer Punkt auf meiner Liste: **Backups über Hetzner**.

Wenn ich das System wirklich langfristig als Cloud-Alternative verwenden möchte, darf ich mich nicht allein auf die NVMe verlassen. RAID habe ich keines – also gilt:

> **NVMe kaputt → alles weg.** 😅

Ein automatisiertes Backup-System (z. B. per *restic*, *borgbackup* oder Hetzner Storage Box) steht daher ganz oben auf der Roadmap.

---

## 🎯 Fazit

Mein Raspberry-Pi-Home-Server hat sich zu einem erstaunlich zuverlässigen kleinen Kraftpaket entwickelt.
Docker + Portainer + Nginx Proxy Manager + Nextcloud ergeben ein sauberes und modernes Setup, das ich jederzeit weiter ausbauen kann.

Mittelerweile ist IPv6 auch stabil.
