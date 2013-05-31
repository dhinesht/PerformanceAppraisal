using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace PerfApp
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public List<Employee_t> emp = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                emp = Session["Employee"] as List<Employee_t>;

                if (emp != null)
                {
                    if (emp[0].PwdReset == 1)
                        Response.Redirect("~/ResetPassword.aspx",false);

                    name.Text = emp[0].Firstname + "" + emp[0].Lastname;
                    using (PerformanceAppEntities db = new PerformanceAppEntities())
                    {
                        int empId = emp[0].Emp_Id;
                        var query = db.Appraisal_t.Where(m => m.EmpId == empId);
                        Appraisal_t app = null;
                        if (query.Count() != 0)
                            app = query.ToList().Single();
                        DataTable Self_Emp = new DataTable();
                        DataColumn Emp_Id = new DataColumn("Emp_Id", System.Type.GetType("System.Int32"));
                        Self_Emp.Columns.Add(Emp_Id);
                        DataColumn Name = new DataColumn("Name", System.Type.GetType("System.String"));
                        Self_Emp.Columns.Add(Name);
                        DataColumn AppPeriod = new DataColumn("AppPeriod", System.Type.GetType("System.String"));
                        Self_Emp.Columns.Add(AppPeriod);
                        DataColumn AppStatus = new DataColumn("AppStatus", System.Type.GetType("System.String"));
                        Self_Emp.Columns.Add(AppStatus);

                        for (int i = 0; i < emp.Count; i++)
                        {
                            DataRow row = Self_Emp.NewRow();
                            row["Emp_Id"] = emp[i].Emp_Id;
                            row["Name"] = emp[i].Firstname + "" + emp[i].Lastname;
                            if (app != null)
                            {
                                DateTime from = app.From ?? DateTime.Now;
                                DateTime to = app.To ?? DateTime.Now;
                                row["AppPeriod"] = from.ToString("dd-MM-yyyy") + " to " + to.ToString("dd-MM-yyyy");
                            }
                            else
                            {
                                row["AppPeriod"] = DateTime.Now.ToString("dd-MM-yyyy") + " to " + DateTime.Now.AddDays(30).ToString("dd-MM-yyyy");
                            }

                            if (app == null)
                                row["AppStatus"] = "Not Completed";
                            else if (app.Status == 1 || app.Status == null)
                                row["AppStatus"] = "partially Completed";
                            else
                                row["AppStatus"] = "Completed";
                            Self_Emp.Rows.Add(row);
                            Self_Emp.AcceptChanges();
                        }
                        if (app != null)
                        {
                            if (app.Status == 0 || app.Status == 1)
                            {
                                SelfGrid.DataSource = Self_Emp;
                                SelfGrid.DataBind();
                            }
                            else
                            {
                                SelfGrid.DataSource = null;
                                SelfGrid.DataBind();
                            }
                        }
                        else
                        {
                            SelfGrid.DataSource = Self_Emp;
                            SelfGrid.DataBind();                            
                        }


                        var query1 = db.Employee_t.Where(m => m.Appraiser == empId);
                        List<Employee_t> AppEmployee = null;
                        DataTable App_Emp = new DataTable();
                        DataColumn AppEmp_Id = new DataColumn("Emp_Id", System.Type.GetType("System.Int32"));
                        App_Emp.Columns.Add(AppEmp_Id);
                        DataColumn AppName = new DataColumn("Name", System.Type.GetType("System.String"));
                        App_Emp.Columns.Add(AppName);
                        DataColumn AppPeriod1 = new DataColumn("AppPeriod", System.Type.GetType("System.String"));
                        App_Emp.Columns.Add(AppPeriod1);
                        DataColumn AppStatus1 = new DataColumn("AppStatus", System.Type.GetType("System.String"));
                        App_Emp.Columns.Add(AppStatus1);
                        if (query1.Count() != 0)
                        {
                            AppEmployee = query1.ToList();
                        }
                        else
                        {
                            tabs1.Visible = false;
                        }
                        if (AppEmployee != null)
                        {
                            for (int i = 0; i < AppEmployee.Count; i++)
                            {
                                DataRow row = App_Emp.NewRow();
                                int Id = AppEmployee[i].Emp_Id;
                                row["Emp_Id"] = AppEmployee[i].Emp_Id;
                                row["Name"] = AppEmployee[i].Firstname + "" + AppEmployee[i].Lastname;
                                var appappraisal = db.Appraisal_t.Where(m => m.EmpId == Id);
                                Appraisal_t appAppr = null;
                                if (appappraisal.Count() != 0)
                                {
                                    appAppr = appappraisal.Single();
                                    DateTime from = appAppr.From ?? DateTime.Now;
                                    DateTime to = appAppr.To ?? DateTime.Now;
                                    row["AppPeriod"] = from.ToString("dd-MM-yyyy") + " to " + to.ToString("dd-MM-yyyy");
                                }
                                else
                                {
                                    row["AppPeriod"] = DateTime.Now.ToString("dd-MM-yyyy") + " to " + DateTime.Now.AddDays(30).ToString("dd-MM-yyyy");
                                }

                                if (appAppr == null)
                                    row["AppStatus"] = "Not Completed";
                                else if (appAppr.Status == 1)
                                    row["AppStatus"] = "partially Completed";
                                else if (appAppr.Status == 2)
                                    row["AppStatus"] = "Completed";
                                else if (appAppr.Status == 3)
                                    row["AppStatus"] = "Appraiser Review Completed";
                                else if (appAppr.Status == 4)
                                    row["AppStatus"] = "Reviewer Review Completed";

                                App_Emp.Rows.Add(row);
                                App_Emp.AcceptChanges();
                            }
                            AppGrid.DataSource = App_Emp;
                            AppGrid.DataBind();
                        }

                        var query2 = db.Employee_t.Where(m => m.Reviewer == empId);
                        List<Employee_t> RevEmployee = null;
                        DataTable Rev_Emp = new DataTable();
                        DataColumn RevEmp_Id = new DataColumn("Emp_Id", System.Type.GetType("System.Int32"));
                        Rev_Emp.Columns.Add(RevEmp_Id);
                        DataColumn RevName = new DataColumn("Name", System.Type.GetType("System.String"));
                        Rev_Emp.Columns.Add(RevName);
                        DataColumn AppPeriod2 = new DataColumn("AppPeriod", System.Type.GetType("System.String"));
                        Rev_Emp.Columns.Add(AppPeriod2);
                        DataColumn AppStatus2 = new DataColumn("AppStatus", System.Type.GetType("System.String"));
                        Rev_Emp.Columns.Add(AppStatus2);
                        if (query2.Count() != 0)
                        {
                            RevEmployee = query2.ToList();
                        }
                        else
                        {
                            tabs2.Visible = false;
                        }
                        if (RevEmployee != null)
                        {
                            for (int i = 0; i < RevEmployee.Count; i++)
                            {
                                DataRow row = Rev_Emp.NewRow();
                                int Id = RevEmployee[i].Emp_Id;
                                row["Emp_Id"] = RevEmployee[i].Emp_Id;
                                row["Name"] = RevEmployee[i].Firstname + "" + RevEmployee[i].Lastname;
                                var appappraisal1 = db.Appraisal_t.Where(m => m.EmpId == Id);
                                Appraisal_t RevAppr = null;
                                if (appappraisal1.Count() != 0)
                                {
                                    RevAppr = appappraisal1.Single();
                                    DateTime from = RevAppr.From ?? DateTime.Now;
                                    DateTime to = RevAppr.To ?? DateTime.Now;
                                    row["AppPeriod"] = from.ToString("dd-MM-yyyy") + " to " + to.ToString("dd-MM-yyyy");
                                }
                                else
                                {
                                    row["AppPeriod"] = DateTime.Now.ToString("dd-MM-yyyy") + " to " + DateTime.Now.AddDays(30).ToString("dd-MM-yyyy");
                                }

                                if (RevAppr == null)
                                    row["AppStatus"] = "Not Completed";
                                else if (RevAppr.Status == 1)
                                    row["AppStatus"] = "partially Completed";
                                else if (RevAppr.Status == 2)
                                    row["AppStatus"] = "Completed";
                                else if (RevAppr.Status == 3)
                                    row["AppStatus"] = "Appraiser Review Completed";
                                else if (RevAppr.Status == 4)
                                    row["AppStatus"] = "Reviewer Review Completed";
                                Rev_Emp.Rows.Add(row);
                                Rev_Emp.AcceptChanges();
                            }
                            RevGrid.DataSource = Rev_Emp;
                            RevGrid.DataBind();
                        }
                    }

                }
                else
                {
                    Response.Redirect("~/Login.aspx",false);
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "Dashboard";
                    log.Method = "Page_Load";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }


        protected void SelfGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    LinkButton BtnReview = (LinkButton)e.Row.FindControl("BtnReview");
                    string Emp_Id = DataBinder.Eval(e.Row.DataItem, "Emp_Id").ToString();
                    BtnReview.Attributes.Add("Emp_Id", Emp_Id);
                    BtnReview.Attributes.Add("Type", "Self");
                    if (e.Row.Cells[3].Text.Equals("Not Completed") || e.Row.Cells[3].Text.Equals("partially Completed"))
                    {
                        BtnReview.Enabled = true;
                    }
                    else
                    {
                        BtnReview.Enabled = false;
                        BtnReview.Visible = false;
                    }

                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;

                    log.Page = "Dashboard";
                    log.Method = "SelfGrid_RowDataBound";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx", false);
                }

            }
        }

        protected void BtnReview_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lb = (LinkButton)sender;
                int Emp_Id = int.Parse(lb.Attributes["Emp_Id"]);

                if (lb.Attributes["Type"] == "Self")
                {
                    Response.Redirect("~/Performance Appraisal.aspx?EmpId=" + Emp_Id.ToString(), false);
                    Session["Type"] = 0;
                }
                else if (lb.Attributes["Type"] == "App")
                {
                    Response.Redirect("~/Performance Appraisal.aspx?EmpId=" + Emp_Id.ToString(), false);
                    Session["Type"] = 1;
                }
                if (lb.Attributes["Type"] == "Rev")
                {
                    Response.Redirect("~/Performance Appraisal.aspx?EmpId=" + Emp_Id.ToString(), false);
                    Session["Type"] = 2;
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;

                    log.Page = "Dashboard";
                    log.Method = "BtnReview_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx", false);
                }

            }
        }

        protected void AppGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    LinkButton BtnReview = (LinkButton)e.Row.FindControl("BtnReview1");
                    string Emp_Id = DataBinder.Eval(e.Row.DataItem, "Emp_Id").ToString();
                    BtnReview.Attributes.Add("Emp_Id", Emp_Id);
                    BtnReview.Attributes.Add("Type", "App");

                    if (e.Row.Cells[3].Text.Equals("Not Completed") || e.Row.Cells[3].Text.Equals("partially Completed") || e.Row.Cells[3].Text.Equals("Appraiser Review Completed") || e.Row.Cells[3].Text.Equals("Reviewer Review Completed"))
                    {
                        BtnReview.Enabled = false;
                        BtnReview.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;

                    log.Page = "Dashboard";
                    log.Method = "AppGrid_RowDataBound";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx", false);
                }

            }
        }

        protected void RevGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    LinkButton BtnReview = (LinkButton)e.Row.FindControl("BtnReview2");
                    string Emp_Id = DataBinder.Eval(e.Row.DataItem, "Emp_Id").ToString();
                    BtnReview.Attributes.Add("Emp_Id", Emp_Id);
                    BtnReview.Attributes.Add("Type", "Rev");

                    if (e.Row.Cells[3].Text.Equals("Not Completed") || e.Row.Cells[3].Text.Equals("partially Completed") || e.Row.Cells[3].Text.Equals("Reviewer Review Completed"))
                    {
                        BtnReview.Enabled = false;
                        BtnReview.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;

                    log.Page = "Dashboard";
                    log.Method = "RevGrid_RowDataBound";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx", false);
                }

            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("Employee");
                if (Session["appraisal"] != null)
                    Session.Remove("appraisal");
                Response.Redirect("~/Login.aspx?logout=1", false);
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;

                    log.Page = "Dashboard";
                    log.Method = "logout_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx", false);
                }

            }

        }

        protected void BtnObj_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Perfappraisal.aspx",false);
        }

    }
}