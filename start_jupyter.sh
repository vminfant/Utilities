screen -list | grep "Jupyter-screen" > /dev/null
sts=`echo $?`

if [ $sts -ne 0 ] 
then
	screen -m -d -S "Jupyter-screen" jupyter notebook

	echo ""
	echo "Jupyter notebook is successfully started"
	echo ""
else
	echo ""
	echo "Jupyter notebook is already running!"
	echo ""
fi

