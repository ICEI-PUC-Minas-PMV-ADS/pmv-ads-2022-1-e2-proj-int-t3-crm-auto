using CRM_Auto.Util;
using System;
using System.Data;

namespace CRM_Auto.Models
{
    public class AgendamentoServicoModel
    {
        public int IdCliente { get; set; }
        public DateTime DataAgendamento{ get; set; }
        public int IdClienteVeiculo { get; set; }

        public string GerarAgendamento(string idCliente, string idVeiculo)
        {
            string command = "INSERT INTO AGENDAMENTO_SERVICO(ID_CLIENTE, DATA_AGENDAMENTO, ID_CLIENTE_VEICULO) VALUES( " +
                $"{idCliente}, " +
                $"'{DataAgendamento.ToString("yyyy/MM/dd HH:mm:ss")}', " +
                $"{idVeiculo});";

            CNN cnn = new CNN();
            cnn.InsertData(command);

            command = "SELECT ID_AGENDAMENTO FROM AGENDAMENTO_SERVICO " +
                $"WHERE DATA_AGENDAMENTO = '{DataAgendamento.ToString("yyyy/MM/dd HH:mm:ss")}';";

            DataTable dt = cnn.GetData(command);
            return dt.Rows[0]["ID_AGENDAMENTO"].ToString();
        }

        public string BuscarIdCliente(string cnpj_cpf)
        {
            string command = "SELECT ID_CLIENTE FROM CLIENTE " +
                $"WHERE CNPJ_CPF = '{cnpj_cpf}';";

            CNN cnn = new CNN();
            DataTable dt = cnn.GetData(command);

            return dt.Rows[0]["ID_CLIENTE"].ToString();
        }

        public string BuscarIdClienteVeiculo (string placa, string idCliente)
        {
            string command = "SELECT ID_VEICULO FROM VEICULO " +
                $"WHERE PLACA_VEICULO = '{placa}';";

            CNN cnn = new CNN();
            DataTable dt = cnn.GetData(command);

            string idVeiculo = dt.Rows[0]["ID_VEICULO"].ToString();

            command = "SELECT ID_CLI_VEICULO FROM CLIENTE_VEICULO " +
                $"WHERE ID_CLIENTE = {idCliente} AND ID_VEICULO = {idVeiculo};";

            dt = cnn.GetData(command);
            return dt.Rows[0]["ID_CLI_VEICULO"].ToString();
        }

        public string BuscarAgendamento(int id)
        {
            string command = "SELECT ID_AGENDAMENTO FROM ORDEM_SERVICO " +
                $"WHERE ID_ORDEM_SERVICO = {id};";

            CNN cnn = new CNN();
            DataTable dt = cnn.GetData(command);

            return dt.Rows[0]["ID_AGENDAMENTO"].ToString();
        }

        public void ApagarAgendamento(string id)
        {
            string command = "DELETE FROM AGENDAMENTO_SERVICO " +
                $"WHERE ID_AGENDAMENTO = {id};";

            CNN cnn = new CNN();
            cnn.InsertData(command);
        }
    }
}
