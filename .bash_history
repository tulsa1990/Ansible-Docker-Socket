pwd
ls -l
cd application/
ls -l
./build-app-image.sh 
./push-app-image.sh 
ls -l
cd ..
ls -l
cd infrastructure/
ls -l
./run-playbook.sh 
exit
exit
cd application/
ls -l
./build-app-image.sh 
./push-app-image.sh 
docker ps -a
exit
exit
ls -l
exit
