<?php
/**
 * @author Dion
 * Создание класса: 10.03.19
 */

class di_mysql
{
    
// private variables:
    
    private $mysqli;    // Объект MyQSLi
    private $result;    // Результат запроса
    private $prefix;    // Префикс таблиц базы данных (например 'di_')
    
    private $num_rows;
    
// params:

// statistic:

    private $query_count = 0;
    private $last_query;      // строка последнего запроса

// public function:

    /**
     * Конструктор
    */
    public function __construct($host = 'localhost', $username, $pass, $dbname, $prefix = '', $port = '', $socket = '')
    {
        // Создаём объект и соединяемся с базой данных
        $this->mysqli = new mysqli($host, $username, $pass, $dbname);
        
        // Проверка на ошибки при соединении с базой:
        if(mysqli_connect_error())
        {
            exit('[cms97 error] di_mysqli: ' . mysqli_connect_error());
        }
        
        $this->prefix = $prefix;
    }

    /**
     * Запрос к базе данных
    */    
    public function query($query_string)
    {
                $this->mysqli->set_charset("utf8");
        
        $this->last_query = $query_string; // заполняем строку "последнего" запроса
        
        $this->result = $this->mysqli->query($query_string);
        
        // если функция вернула NULL:
        if(!$this->result)
        {
            exit('[cms97 error] di_mysqli: query fail "' . $query . '"'); // прекращаем выполнение скрипта и выводим сообщение об ошибке
        }
        
        $this->num_rows = $this->result->num_rows;
        
        $query_count++; // увеличиваем счеткик запросов
        
        return $this->result;
    }

// DML (Data Manipulation Language):
 
    /**
     * Select-запрос к базе данных.
     * @table - имя таблицы
     */
    public function select($table)
    {
        return $this->query('SELECT * FROM `' . $this->prefix . $table . '`')->fetch_all(MYSQLI_ASSOC);
        
        // $this->mysqli->result->fetch_assoc;
    }
    
    public function insert()
    {
        
    }
    
    public function update()
    {
        
    }
    
    public function delete()
    {
        
    }
    
// 
    /**
     * utf8_unicode_ci - способ сортировки и сравнения, для многоязычных сайтов лучше использовать utf8_unicode_ci
     */
    public function create_database($name, $character = 'utf8', $collate = 'utf8_unicode_ci')
    {
        $this->query('CREATE DATABASE `' . $name . '` CHARACTER SET ' . $character . ' COLLATE ' . $collate);
    }

// set params:

    public function set_char()
    {
        
    }
    
// get:

    public function get_query_count()
    {
        return $this->query_count;
    }
    
    public function get_last_query()
    {
        return $this->last_query;
    }
    
    public function get_num_rows()
    {
        return $this->num_rows;
    }
    
// private function:

    /**
     * Функция соединения с базой данных
     */
    private function connect()
    {
        
    }

}

?>