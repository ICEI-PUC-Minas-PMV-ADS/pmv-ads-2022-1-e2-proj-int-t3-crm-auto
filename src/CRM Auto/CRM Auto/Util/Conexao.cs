﻿using System;
using MySql.Data.MySqlClient;
using System.Data;

namespace CRM_Auto.Util
{
    public class Conexao
    {
        private const string _strCon = @"server=ns254.hostgator.com.br;" +
                                    "user id=devacc56_homolog;" +
                                    "password=sga6cmr#;" +
                                    "database=devacc56_CRMAUTO;" +
                                    "persistsecurityinfo=False";
        private string vsql = "";

        public MySqlConnection objCon = null;

        #region "Métodos de conexão como o banco"

        public bool conectar()
        {
            objCon = new MySqlConnection(_strCon);
            try
            {
                objCon.Open();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool desconectar()
        {
            if (objCon.State != ConnectionState.Closed)
            {
                objCon.Close();
                objCon.Dispose();
                return true;
            }
            else
            {
                objCon.Dispose();
                return false;
            }
        }

        public DataTable ListaGrid()
        {
            // Esta função lê a tabela Cliente e devolve para um DataGridView.
            vsql = "SELECT * FROM CLIENTE ORDER BY NOME";
            MySqlCommand objcmd = null;

            if (this.conectar())
            {
                try
                {
                    objcmd = new MySqlCommand(vsql, objCon);
                    MySqlDataAdapter adp = new MySqlDataAdapter(objcmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    return dt;
                }
                catch (MySqlException sqlerr)
                {
                    throw sqlerr;
                }
                finally
                {
                    this.desconectar();
                }
            }
            else
            {
                return null;
            }
        }

        public string Max()
        {
            // Esta função busca o maior código de cliente e devolve numa string.
            vsql = "SELECT MAX(CODCLIENTE) FROM CLIENTE";
            MySqlCommand objcmd = null;
            if (this.conectar())
            {
                try
                {
                    objcmd = new MySqlCommand(vsql, objCon);
                    return Convert.ToString(objcmd.ExecuteScalar());
                }
                catch (MySqlException sqlerr) { throw sqlerr; }
                finally { this.desconectar(); }
            }
            else { return "0"; }
        }
        public bool Update(ArrayList reg)
        {
            // Esta função faz um update na tabela Cliente e recebe parâmetros num ArrayList
            vsql = "UPDATE CLIENTE SET NOME = @NOME, ENDERECO = @ENDERECO" +
                   " WHERE CODCLIENTE = @CODCLIENTE";
            MySqlCommand objcmd = null;

            if (this.conectar())
            {
                try
                {
                    objcmd = new MySqlCommand(vsql, objCon); // Cria comando do MySql
                                                             // Adiciona o arrayList nos parâmetros
                    objcmd.Parameters.Add(new MySqlParameter("@CODCLIENTE", reg[0]));
                    objcmd.Parameters.Add(new MySqlParameter("@NOME", reg[1]));
                    objcmd.Parameters.Add(new MySqlParameter("@ENDERECO", reg[2]));

                    objcmd.ExecuteNonQuery(); // Executa a consulta
                    return true;
                }
                catch (MySqlException sqlerr)
                {
                    MessageBox.Show(sqlerr, ":: Mensagem", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                    throw sqlerr;
                }
                finally
                {
                    this.desconectar();
                }
            }
            else return false;
        }
    }
}
