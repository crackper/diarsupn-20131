using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBSystem.Entities;

namespace DBSystem.Repository
{
    public class ClienteRepository:MasterRepository,IClienteRepository
    {
        public List<Cliente> GetFromClienteByCriterio(string criterio)
        {
            var query = from c in Context.Clientes
                        select c;

            if (criterio != string.Empty && criterio !=null )
            {
                query = from c in query
                        where c.rucDni.Contains(criterio) ||
                              c.razonSocial.ToUpper().Contains(criterio.ToUpper())
                        select c;
            }

            return query.ToList();
        }

        public Cliente GetFromClienteById(int id)
        {
            return Context.Clientes.Find(id);
        }

        public Cliente GetFromClienteByRucDni(string rucDni)
        {
            return Context.Clientes.Where(c => c.rucDni.Equals(rucDni)).SingleOrDefault();
        }

        public void AddCliente(Cliente cliente)
        {
            Context.Clientes.Add(cliente);
            Context.SaveChanges();
        }

        public void UpdateCliente(Cliente cliente)
        {
            Context.Entry(Context).State = System.Data.EntityState.Modified;
            Context.SaveChanges();
        }

        public void RemoveProducto(int id)
        {
            var existe = Context.Clientes.Find(id);

            if (existe !=null)
            {
                Context.Clientes.Remove(existe);
                Context.SaveChanges();
            }
        }
    }
}
