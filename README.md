# kubernetes
apiVersion: v1
kind: Service
metadata:
  name: mysql-master
  labels:
    app: mysql-master
spec:
  ports:
  - port: 3306
    targetPort: 3306
  selector:
    app: mysql-master
    
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql-master
  labels:
    app: mysql-master
spec:
  serviceName: "mysql-master"
  replicas: 1
  selector:
    matchLabels:
      app: mysql-master
  template:
    metadata:
      labels:
        app: mysql-master
    spec:
      terminationGracePeriodSeconds: 10
      containers:
      - name: mysql-master
        image: sz33sitqdb00ap0007.bf.cn/public/mysql-master:v5.7.20
        ports:
        - containerPort: 3306
        env:
        - name: MYSQL_SECRET_PASSWORD
          valueFrom:
            secretKeyRef:
            name: default-mysql-secret
            key: mysqlRootPassword
        - name: MYSQL_REPLICATION_USER
          valueFrom:
             secretKeyRef:
             name: default-mysql-secret
             key: mysqlReplicationUser
        - name: MYSQL_REPLICATION_PASSWORD
          valueFrom:
            secretKeyRef:
            name: default-mysql-secret
            key: mysqlReplicationPassword
        resources:
          limits:
            cpu: "500m"
            memory: 1Gi
          requests:
            cpu: "500m"
            memory: 1Gi
        volumeMounts:
        - name: mysql-master-data
          mountPath: /opt/mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-master-data
      annotations:
        volume.beta.kubernetes.io/storage-class: "fast"
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 10Gi
