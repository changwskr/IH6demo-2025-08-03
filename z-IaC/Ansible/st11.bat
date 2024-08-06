
파일을 다운로드하는 주제
ssh root@localhost -p 20022


vi second-playbook.yml
---
- name: Download Tomcat9 from tomcat.apache.org
  hosts: devops
  tasks:
   - name: Create a Directory /opt/tomcat9
     file:
       path: /opt/tomcat9
       state: directory
       mode: 0755
   - name: Download Tomcat using get_url
     get_url:
       url: https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz
       dest: /opt/tomcat9
       mode: 0755
       checksum: sha512:https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz.sha512

[root@c7d8ab75a377 work]# ansible-playbook second-playbook.yml
