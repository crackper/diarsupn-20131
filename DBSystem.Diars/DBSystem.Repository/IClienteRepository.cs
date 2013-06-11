using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBSystem.Entities;

namespace DBSystem.Repository
{
    public interface IClienteRepository
    {
        List<Cliente> GetFromClienteByCriterio(string criterio);
        Cliente GetFromClienteById(Int32 id);
        Cliente GetFromClienteByRucDni(string rucDni);
        void AddCliente(Cliente cliente);
        void UpdateCliente(Cliente cliente);
        void RemoveProducto(Int32 id);
    }
}
