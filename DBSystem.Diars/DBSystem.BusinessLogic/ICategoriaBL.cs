using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBSystem.Entities;

namespace DBSystem.BusinessLogic
{
    public interface ICategoriaBL
    {
        List<Categoria> GetAllFromCategoria();
        List<Categoria> GetFromCategoriaByCriterio(string criterio);
        Categoria GetFromCategoriaById(Int32 id);
        void AddCategoria(Categoria categoria);
        void UpdateCategoria(Categoria categoria);
        void RemoveCategoria(Int32 id);
    }
}
