using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
namespace PerfApp
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                List<Employee_t> emp = Session["Employee"] as List<Employee_t>;
                if (emp == null)
                    Response.Redirect("~/Login.aspx",false);
                lblError.Text = "";
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;

                    log.Page = "ResetPassword";
                    log.Method = "Page_Load";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx", false);
                }

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                List<Employee_t> emp = Session["Employee"] as List<Employee_t>;
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    string Username = emp[0].Username;
                    var query = db.Employee_t.Where(m => m.Password == OldTextBox.Text.Trim() && m.Username == Username);
                    if (query.Count() != 0)
                    {
                        Employee_t employee = query.Single();
                        employee.Password = NewTextBox.Text;
                        employee.PwdReset = 0;
                        db.SaveChanges();
                        lblError.Text = "";
                        emp[0].Password = NewTextBox.Text;
                        emp[0].PwdReset = 0;
                        Response.Redirect("~/Dashboard.aspx",false);
                    }
                    else
                    {
                        lblError.Text = "Please enter correct old password";
                    }
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;

                    log.Page = "ResetPassword";
                    log.Method = "btnSubmit_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx", false);
                }

            }
        }
    }
}