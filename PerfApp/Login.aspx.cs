using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.EntityModel;

namespace PerfApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["logout"] != null)
                {
                    if (Request.QueryString["logout"].ToString().Contains("1"))
                        error.Text = "Logged out Successfully";
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "Login";
                    log.Method = "Page_Load";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                List<Employee_t> emp = FindByName(UserNameTextBox.Text, PasswordTextBox.Text);
                Session["Employee"] = emp;
                if (emp != null && emp.Count != 0)
                {
                    Response.Redirect("~/Dashboard.aspx",false);


                }
                else
                {
                    error.Text = "Incorrect Username<br/> and/or Password";
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "Login";
                    log.Method = "LoginButton_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }
            }

        }

        public List<Employee_t> FindByName(string Username, string Password)
        {
            try
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    var query = from c in db.Employee_t
                                where c.Username.Contains(Username) && c.Password.Contains(Password)
                                select c;
                    return query.ToList();
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "Login";
                    log.Method = "FindByName";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }
                return null;
            }

        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/ForgotPassword.aspx",false);
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "Login";
                    log.Method = "btnForgot_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }
    }
}