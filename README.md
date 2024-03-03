# Batch Script for Scheduling Pentaho Data Integration Jobs

### Script em lote para Agendar Jobs do Pentaho Data Integration

The following is an example of a batch script to schedule the execution of Pentaho Data Integration jobs and generate logs during the process.

0. **Crie o arquivo JOB (.kjb)** / Create the JOB file (.kjb)
   - Antes de criar o script em lote, você precisa criar o arquivo .kjb contendo o job do Pentaho Data Integration que deseja agendar.
     - *Before creating the batch script, you need to create the .kjb file containing the Pentaho Data Integration job you want to schedule.*
     - 
1. **Crie o arquivo batch (.bat)** / Create the batch file (.bat)
   - Agora, crie o script em lote (.bat) que será responsável por executar o job.
     - *Now, create the batch script (.bat) that will be responsible for executing the job.*

2. **Salve o arquivo** / Save the file
   - Salve o arquivo .bat no local desejado em seu sistema.
     - *Save the .bat file in the desired location on your system.*

3. **Crie a tarefa agendada no Windows** / Create the scheduled task in Windows
   - Use o Agendador de Tarefas do Windows para agendar a execução do script em lote (.bat) em intervalos específicos.
     - *Use the Windows Task Scheduler to schedule the execution of the batch script (.bat) at specific intervals.*

## Agendador de Tarefas do Windows (Windows Task Scheduler)

O Agendador de Tarefas do Windows é uma ferramenta integrada que permite agendar a execução de programas ou scripts em intervalos específicos. Ele oferece uma interface gráfica amigável para definir e gerenciar tarefas agendadas.

Quando você cria uma tarefa agendada, pode especificar detalhes como a hora de início, a frequência de repetição, o usuário que executará a tarefa e as ações a serem executadas, que incluirão a execução do seu script em lote.

*Windows Task Scheduler is an integrated tool that allows you to schedule the execution of programs or scripts at specific intervals. It provides a user-friendly graphical interface for defining and managing scheduled tasks.*


## Exemplo de Script em Lote (Batch Script Example)

```batch
REM Desativa a exibição dos comandos no prompt de comando enquanto o arquivo batch está sendo executado.
REM Disables the display of commands in the command prompt while the batch file is being executed.
@echo off

REM Garante que as alterações feitas nas variáveis de ambiente durante a execução do arquivo batch sejam revertidas quando o script for concluído.
REM Ensures that changes made to environment variables during the execution of the batch file are reverted when the script is completed.
setlocal

REM Usado para definir o título da janela do prompt de comando.
REM Used to set the title of the command prompt window.
TITLE JOB_TASK

REM Define o caminho para a pasta onde o Kitchen está localizado
REM Sets the path to the folder where Kitchen is located.
set "KITCHEN_PATH=C:\pdi-ce-9.4.0.0-343\data-integration"

REM Define o caminho para o arquivo .kjb
REM Sets the path to the .kjb file. %~dp0 expands to the directory path of the batch script itself.
set "JOB_PATH=%~dp0\job.kjb"

REM Obtém a data atual no formato YYYY-MM-DD
REM Obtains the current date in the format YYYY-MM-DD.
set "DATE=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%"

REM Define o nome do arquivo de log com a data atual
REM Sets the name of the log file with the current date.
set "LOG_FILE=%~dp0\%DATE%.log"

REM Limpa o arquivo de log existente (se houver)
REM Clears the existing log file (if any).
echo. > "%LOG_FILE%"

REM Executa o Kitchen com o parâmetro /file e o caminho para o job, redirecionando a saída para o arquivo de log.
REM Executes Kitchen with the /file parameter and the path to the job, redirecting the output to the log file.
"%KITCHEN_PATH%\Kitchen.bat" /file "%JOB_PATH%" >> "%LOG_FILE%"

REM Finaliza o ambiente local que foi iniciado.
REM Ends the local environment that was started.
endlocal
