<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPedido.aspx.cs" Inherits="DBSystem.Web.Ventas.frmPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
<div class="row">
    <div class="half">
         <asp:UpdatePanel ID="upCliente"  runat="server">
        <ContentTemplate>
             <div class="forms">
                <fieldset>
                <legend>Cliente</legend>
                <ul>
                    <li>
                        <label class="bold" >Ruc/DNI</label>
                        <asp:TextBox ID="txtRucDNI" runat="server" /> 
                        <asp:Button ID="btnBuscarCliente" CssClass="btn btn-small" Text="..." runat="server" 
                    onclick="btnBuscarCliente_Click" />
                    </li>
                    <li>
                        <label class="bold" >Razón Social</label>
                        <asp:TextBox ID="txtRazonSocial" runat="server" Width="100%" /><br />
                    </li>
                    <li>
                        <label class="bold" >Dirección</label>
                        <asp:TextBox ID="txtDireccion" Width="100%" runat="server" />
                    </li>
                </ul>             
            </fieldset>
             </div>    
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBuscarCliente" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    </div>
   <div class="half">
       <div class="forms">
            <ul>
                <li>
                    <label class="bold">Fecha</label>
                    <asp:TextBox ID="txtFecha" runat="server" />
                    <ajaxToolkit:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="txtFecha">
                    </ajaxToolkit:CalendarExtender>
                </li>
                <li>
                    <label class="bold">Tipo de Pago</label>
                    <asp:DropDownList ID="ddlTipoPago" runat="server"/>
                </li>
            </ul>
       </div>
   </div>
</div>
    
    
    <asp:UpdatePanel ID="udpProductos" runat="server">
        <ContentTemplate>            
            <asp:Panel ID="pnlProductos" runat="server">
             <fieldset>
                <legend>Productos</legend>
                <label class="bold">Criterio</label>
                <span class="btn-group">
                    <asp:TextBox ID="txtCriterio" CssClass="input-search" Width="200px" runat="server" />
                    <asp:Button ID="btnBuscarProducto" CssClass="btn btn-round" Text="Buscar" runat="server" />
                </span>           
                <br />
                <asp:GridView ID="gvProductos" runat="server" DataSourceID="odsProductos" 
                    AllowPaging="True" AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    onrowcommand="gvProductos_RowCommand" PageSize="6" >
                    <Columns>
                        <asp:BoundField DataField="Categoria.Descripcion" HeaderText="Categoria" 
                            SortExpression="Categoria" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                            SortExpression="Codigo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" 
                            SortExpression="Descripcion" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" 
                            SortExpression="Precio" />
                        <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                        <asp:CheckBoxField DataField="Descontinuado" HeaderText="Descontinuado" 
                            SortExpression="Descontinuado" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:Button ID="bntAdd" CssClass="btn" CommandName="AddDetalle" CommandArgument='<%# Eval("Id") %>'  runat="server" Text="Agregar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="thead-black" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsProductos" runat="server" 
                    onobjectcreating="odsProductos_ObjectCreating" 
                    SelectMethod="GetFromProductoByCriterio" 
                    TypeName="DBSystem.BusinessLogic.ProductoBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCriterio" Name="criterio" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </fieldset>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBuscarProducto" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="udpDetalle" runat="server">
        <ContentTemplate>
            <fieldset>
                <legend>Detalle Pedido</legend>
                <asp:GridView ID="gvDetallePedido" runat="server" AutoGenerateColumns="False" > 
                    <Columns>
                        <asp:BoundField DataField="Producto.Codigo" HeaderText="Codigo" />
                        <asp:BoundField DataField="Producto.Descripcion" HeaderText="Descripción" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCantidad" runat="server" Text="<%# Bind('cantidad') %>" 
                                    Width="50px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio">
                            <ItemTemplate>
                                <asp:TextBox ID="txtPrecio" runat="server" Text="<%# Bind('precio') %>" 
                                    Width="50px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Monto">
                            <ItemTemplate>
                                <asp:Label ID="lblMonto" runat="server" Text="<%# Bind('monto') %>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones">
                            
                            <ItemTemplate>
                                <asp:Button ID="btnQuitar" runat="server" 
                                    CommandArgument="Eval('productoId')" 
                                    CommandName="QuitarDetalle" 
                                    CssClass="btn" Text="Quitar" />
                            </ItemTemplate>
                            
                        </asp:TemplateField>                        
                    </Columns>
                    <HeaderStyle CssClass="thead-black" Font-Bold="True" ForeColor="White" />
                </asp:GridView>             
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvProductos" EventName="RowCommand" />
        </Triggers>
    </asp:UpdatePanel>
       
     
    
</asp:Content>
