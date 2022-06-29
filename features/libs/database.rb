#require 'rubygems'
#require 'oci8'



class Database
  def initialize
    user = CONFIG["database"]["user"]
    pass = CONFIG["database"]["password"]
    host = CONFIG["database"]["host"]
    @connection = OCI8.new(user, pass,host)
  end

  def select_proposta?

        ##pega a linha do registro
    result = @connection.exec("select nome_completo from cliente where id = 1 "){|r| puts 'RESULT : '+ r.join}
    put result
    return result
    end
    #  @connection.exec("Select * From PROPOSTA where ID_CLIENTE = #{@id_cleinte}")


  def select_cliente_id nome
     @id_cleinte = @connection.exec("Select * From CLIENTE where NOME_COMPLETO = #{nome}")
  end

  def update_contratos_cadastratos_assinado
    nome_consolacao = CONFIG["cliente"]["cliente_ja_cadastrato_consolacao"]
    nome_vila_mariana = CONFIG["cliente"]["cliente_ja_cadastrato_vilamariana"]
    nome_butanta = CONFIG["cliente"]["cliente_ja_cadastrato_butanta"]
    @connection.exec("UPDATE PROPOSTA p SET p.STATUS = 'Assinado' WHERE p.STATUS = 'Enviado' AND  p.CLIENTE LIKE '%#{nome_consolacao}%' AND  p.CLIENTE LIKE '%#{nome_vila_mariana}%' AND p.CLIENTE LIKE  '%#{nome_butanta}%'"){|r| puts 'RESULT : '+ r.join}
    @connection.exec("COMMIT")
    sleep 4
    #@connection.exec("UPDATE PROPOSTA p SET p.STATUS = 'Assinado' WHERE p.STATUS = 'Enviado' AND  p.CLIENTE LIKE '%#{nome_vila_mariana}%'"){|r| puts 'RESULT : '+ r.join}
    #@connection.exec("COMMIT")
    #@connection.exec("UPDATE PROPOSTA p SET p.STATUS = 'Assinado' WHERE p.STATUS = 'Enviado' AND  p.CLIENTE LIKE '%#{nome_butanta}%'"){|r| puts 'RESULT : '+ r.join}
    #@connection.exec("COMMIT")
  end

  def select_unidades_consolaca data_in , data_fin
    result = @connection.exec("SELECT
unidade.TITULO
FROM
APARTAMENTO_UNIDADE unidade
LEFT JOIN APARTAMENTO a2 ON a2.ID = unidade.APARTAMENTO_ID
LEFT JOIN APARTAMENTO_CATEGORIA ac ON ac.ID = unidade.CATEGORIA_ID
LEFT JOIN EDIFICIO e ON e.ID = a2.EDIFICIO_ID
WHERE e.NOME LIKE '%Consola%'
AND ac.NOME = 'Studio Individual'
AND unidade.ID
NOT IN
( SELECT
RESERVA.UNIDADE_ID
FROM
RESERVA reserva
WHERE
UNIDADE_ID IS NOT NULL
AND
(
(reserva.DATA_INICIO <= to_date('2021-08-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
AND
reserva.DATA_FINAL >= to_date('2021-08-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
OR
(reserva.DATA_INICIO <= to_date('2021-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
AND reserva.DATA_FINAL >= to_date('2021-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'))
OR (reserva.DATA_INICIO >= to_date('2021-08-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
AND reserva.DATA_FINAL <= to_date('2021-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'))
)
)
AND EXISTS (SELECT * FROM TARIFARIO t WHERE T.EDIFICIO_ID = a2.EDIFICIO_ID AND T.CATEGORIA_ID = ac.ID)"){|r| puts 'RESULT : '+  r. join}
     return result.to_s
  end
end

