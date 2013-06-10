using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.Unity;
using DBSystem.Entities;
using DBSystem.Repository;

namespace DBSystem.BusinessLogic
{
    public class CategoriaBL:ICategoriaBL
    {
        [Dependency]
        public ICategoriaRepository CategoriaRepository { get; set; }

        public List<Categoria> GetAllFromCategoria()
        {
            return CategoriaRepository.GetAllFromCategoria();
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
