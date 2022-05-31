﻿using Microsoft.AspNetCore.Mvc;
using CRM_Auto.Models;

namespace CRM_Auto.Controllers
{
    public class OficinaController : Controller
    {
        public IActionResult LoginColaborador()
        {
            return View();
        }

        [HttpPost]
        public IActionResult VerificacaoLogin(UsuarioModel usuario)
        {
            bool verificacao = usuario.ValidarLogin();
            if (verificacao)
            {
                return RedirectToAction("Sucesso");
            }
            return RedirectToAction("LoginColaborador");
        }

        public IActionResult Sucesso()
        {
            return View("Sucesso");
        }

        public IActionResult CadastroVeiculo()
        {
            return View("CadastroVeiculo");
        }

        public IActionResult OperacaoCadastroVeiculo(VeiculoModel veiculo)
        {
            veiculo.CadastroVeiculo();
            return RedirectToAction("CadastroVeiculo");
        }

        public IActionResult CadastrarFuncionario()
        {
            return View("CadastroDeFuncionario");
        }

        [HttpPost]
        public IActionResult InserirFuncionario(FuncionarioModel funcionario)
        {
            string nome = funcionario.Nome;
            string funcao = funcionario.Funcao;
            string id_oficina = funcionario.Id_oficina;

            funcionario.InserirFuncionario(nome, funcao, id_oficina);

            bool resultadoInsercao = funcionario.ValidarInsercaoFuncionario();
            if (resultadoInsercao)
            {
                return View("CadastroRealizadoComSucesso");
            }
            return RedirectToAction("Sucesso");
        }

        public IActionResult BuscarFuncionarios()
        {
            FuncionarioModel funcionario = new FuncionarioModel();
            ViewBag.BuscarFuncionarios = funcionario.BuscarFuncionarios();
            return View();
        }

        [HttpPost]
        public IActionResult AlterarFuncionario(FuncionarioModel funcionario)
        {
            string nome = funcionario.Nome;
            string funcao = funcionario.Funcao;
            string id_oficina = funcionario.Id_oficina;

            funcionario.AlterarFuncionario(nome, funcao, id_oficina);

            return View("CadastroRealizadoComSucesso");

        }

        [HttpPost]
        public IActionResult ExcluirFuncionario(FuncionarioModel funcionario)
        {
            string nome = funcionario.Nome;
            string funcao = funcionario.Funcao;
            string id_oficina = funcionario.Id_oficina;

            funcionario.ExcluirFuncionario(nome, funcao, id_oficina);

            return View("CadastroRealizadoComSucesso");

        }
    }
}
