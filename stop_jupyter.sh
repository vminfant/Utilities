screen -list | grep "Jupyter-screen" > /dev/null
sts=`echo $?`

if [ $sts -eq 0 ] 
then
    screen -S "Jupyter-screen" -X kill 

    echo ""
    echo "Jupyter notebook is successfully stopped!"
    echo ""
else
    echo ""
    echo "There is no active Jupyter notebook screen found!"
    echo ""
fi
