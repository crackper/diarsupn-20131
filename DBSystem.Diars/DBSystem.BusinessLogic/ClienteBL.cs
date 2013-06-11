using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.Unity;
using DBSystem.Entities;
using DBSystem.Repository;

namespace DBSystem.BusinessLogic
{
    public class ClienteBL:IClienteBL
    {
        public IClienteRepository ClienteRepository { get; set; }

        public List<Cliente> GetFromClienteByCriterio(string criterio)
        {
            return ClienteRepository.GetFromClienteByCriterio(criterio);
        }

        public Cliente GetFromClienteById(int id)
        {
            return ClienteRepository.GetFromClienteById(id);
        }

        public Cliente GetFromClienteByRucDni(string rucDni)
        {
            return ClienteRepository.GetFromClienteByRucDni(rucDni);
        }

        public void AddCliente(Cliente cliente)
        {
            ClienteRepository.AddCliente(cliente);
        }

        public void UpdateCliente(Cliente cliente)
        {
            ClienteRepository.UpdateCliente(cliente);
        }

        public void RemoveProducto(int id)
        {
            ClienteRepository.RemoveProducto(id);
        }
    }
}
