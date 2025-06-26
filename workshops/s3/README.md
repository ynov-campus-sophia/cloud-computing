# configure s3cmd

```
sudo apt-get install s3cmd
s3cmd --configure

---
Access Key ID: DO00MFXBRTX9M3P6PFMW
Secret Key: b60qfDKf4F/xkU+1PvtsPwzhd2bjL1bUfCcoxtdhyYQ
s3 endpoint: ams3.digitaloceanspaces.com
DNS style: %(bucket)s.ams3.digitaloceanspaces.com
---

verify the conf in 
~/.s3cfg

➜  cloud-computing git:(master) ✗ s3cmd  ls  s3://backup-ynov                                           do-ams3-supervision-cluster
2025-06-17 19:13    741931234  s3://backup-ynov/Le Gendarme en Balade (1970) French (Eng Subs).avi
2025-06-16 14:41  18217847266  s3://backup-ynov/Uncrashed.FPV.Drone.Simulator.v2025.05.22.rar
2025-05-16 14:01       248111  s3://backup-ynov/tools-to-install.pdf
```

