//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SistemaSeguros
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cobertura
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cobertura()
        {
            this.CoberturaPorPolizaCliente = new HashSet<CoberturaPorPolizaCliente>();
            this.Poliza = new HashSet<Poliza>();
        }
    
        public int ID_Cobertura { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public double PrecioMensual { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CoberturaPorPolizaCliente> CoberturaPorPolizaCliente { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Poliza> Poliza { get; set; }
    }
}
