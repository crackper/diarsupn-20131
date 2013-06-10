using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBSystem.Entities;

namespace DBSystem.Repository
{
    public class CategoriaRepository: MasterRepository, ICategoriaRepository
    {
        public List<Categoria> GetAllFromCategoria()
        {
            return Context.Categorias.ToList();
        }

        public List<Categoria> GetFromCategoriaByCriterio(string criterio)
        {
            throw new NotImplementedException();
        }

        public Categoria GetFromCategoriaById(int id)
        {
            throw new NotImplementedException();
        }

        public void AddCategoria(Categoria categoria)
        {
            throw new NotImplementedException();
        }

        public void UpdateCategoria(Categoria categoria)
        {
            throw new NotImplementedException();
        }

        public void RemoveCategoria(int id)
        {
            throw new NotImplementedException();
        }
    }
}
