# Способ профилирования WEB приложений


## Procpath + ab

[PYPI](https://pypi.org/project/Procpath/)

TODO Попробовать 


## psrecord + ab

### Используемые средства:

 - Library to record the CPU and memory activity of a process - [psrecord](https://pypi.org/project/psrecord/)
 - Matplotlib is a comprehensive library for creating static, animated, and interactive visualizations in Python - [matplotlib](https://pypi.org/project/matplotlib/)
 - Apache HTTP server benchmarking tool - [ab](https://www.opennet.ru/man.shtml?topic=ab&category=8&russian=2)

### Порядок действий

1) Устанавливаем psrecord и matplotlib, предварительно создав venv
    ```shell
    pip3 install psrecord matplotlib
    ```
2) Запускаем программу и узнаем PID 
3) Запускаем psrecord
    ```shell
    psrecord $PID --interval 1 --include-children --plot profiling_result.png
    ```
4) Подаём нагрузку на приложение
     ```shell
    ab -c 10 -n 100 http://host:port/path
    ```
   
### Полезные ссылки

 - [Инструкция](https://www.skleroznik.in.ua/2013/08/30/ispolzuem-ab-dlya-testirovaniya-proizvoditelnosti-web-prilozheniya/) ab
