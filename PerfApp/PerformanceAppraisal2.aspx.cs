using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data.Entity.Validation;
using System.Data.EntityClient;
using System.Data.EntityModel;
using System.Diagnostics;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
namespace PerfApp
{
    public partial class PerformanceAppraisal2 : System.Web.UI.Page
    {
        public List<Projects_t> Projects = new List<Projects_t>();
        public List<Skills_t> Skills = new List<Skills_t>();
        public List<int> Rating = null;
        List<Employee_t> emp = null;
        public Appraisal_t appraisal = null;
        public List<EmpSkills_t> empSkills = null;
        List<EmpProject_t> AreaDones = null;
        List<EmpProject_t> AreaAchieves = null;
        List<EmpProject_t> KeyAchievePro = null;
        List<EmpProject_t> empProject = null;
        public string[] Project = null;
        public int empId = 0;
        public int type = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                emp = Session["Employee"] as List<Employee_t>;
                if (emp == null)
                    Response.Redirect("~/Login.aspx",false);


                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    var query = from c in db.Projects_t
                                select c;
                    Projects = query.ToList();
                }
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    var query = from c in db.Skills_t
                                select c;
                    Skills = query.ToList();
                }
                Rating = new List<int>();

                for (int i = 1; i <= 5; i++)
                {
                    Rating.Add(i);
                }
                List<String> RatingItem = new List<string>();
                RatingItem.Add("Extraordinary");
                RatingItem.Add("Exemplary +");
                RatingItem.Add("Exemplary");
                RatingItem.Add("Enabler +");
                RatingItem.Add("Enabler");
                appraisal = Session["appraisal"] as Appraisal_t;



                Session["isSaved"] = 0;
                if (Session["Type"] != null)
                {
                    type = Convert.ToInt32(Session["Type"].ToString());
                    DisableControls(type);
                }

                if (!Page.IsPostBack)
                {

                    if (type == 0)
                        name.Text = emp[0].Firstname + "&nbsp;" + emp[0].Lastname;
                    else
                        name.Text = Session["Firstname"].ToString() + "&nbsp;" + Session["Lastname"].ToString();
                    SelfAssessment0.DataSource = RatingItem;
                    SelfAssessment0.DataBind();
                    AssessorRating0.DataSource = RatingItem;
                    AssessorRating0.DataBind();
                    FinalizedRating.DataSource = RatingItem;
                    FinalizedRating.DataBind();

                    Newskillacq0.DataSource = RatingItem;
                    Newskillacq0.DataBind();
                    Newskillacq2.DataSource = RatingItem;
                    Newskillacq2.DataBind();
                    
                    SkillImprovisation0.DataSource = RatingItem;
                    SkillImprovisation0.DataBind();
                    SkillImprovisation2.DataSource = RatingItem;
                    SkillImprovisation2.DataBind();
                    InnovativeThoughts0.DataSource = RatingItem;
                    InnovativeThoughts0.DataBind();
                    InnovativeThoughts2.DataSource = RatingItem;
                    InnovativeThoughts2.DataBind();
                    CertificationsAchievedGeneric0.DataSource = RatingItem;
                    CertificationsAchievedGeneric0.DataBind();
                    CertificationsAchievedGeneric2.DataSource = RatingItem;
                    CertificationsAchievedGeneric2.DataBind();
                    CertificationsAchievedManagement0.DataSource = RatingItem;
                    CertificationsAchievedManagement0.DataBind();
                    CertificationsAchievedManagement2.DataSource = RatingItem;
                    CertificationsAchievedManagement2.DataBind();
                    CertificationsAchievedProduct0.DataSource = RatingItem;
                    CertificationsAchievedProduct0.DataBind();
                    CertificationsAchievedProduct2.DataSource = RatingItem;
                    CertificationsAchievedProduct2.DataBind();
                    KnowledgeSharingSessions0.DataSource = RatingItem;
                    KnowledgeSharingSessions0.DataBind();
                    KnowledgeSharingSessions2.DataSource = RatingItem;
                    KnowledgeSharingSessions2.DataBind();
                    WhitePapers0.DataSource = RatingItem;
                    WhitePapers0.DataBind();
                    WhitePapers2.DataSource = RatingItem;
                    WhitePapers2.DataBind();
                    SelfMotivating0.DataSource = RatingItem;
                    SelfMotivating0.DataBind();
                    SelfMotivating2.DataSource = RatingItem;
                    SelfMotivating2.DataBind();
                    Attitude0.DataSource = RatingItem;
                    Attitude0.DataBind();
                    Attitude2.DataSource = RatingItem;
                    Attitude2.DataBind();
                    Commitment0.DataSource = RatingItem;
                    Commitment0.DataBind();
                    Commitment2.DataSource = RatingItem;
                    Commitment2.DataBind();
                    Communication0.DataSource = RatingItem;
                    Communication0.DataBind();
                    Communication2.DataSource = RatingItem;
                    Communication2.DataBind();
                    
                    if (appraisal != null)
                        LoadControls();
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal2";
                    log.Method = "Page_Load";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }

        private void DisableControls(int type1)
        {
            try
            {
                if (type1 == 0)
                {
                    AssessorRating0.Enabled = false;
                    FinalizedRating.Enabled = false;

                    Newskillacq2.Enabled = false;
                    Newskillacq3.Enabled = false;

                    InnovativeThoughts2.Enabled = false;
                    InnovativeThoughts3.Enabled = false;

                    CertificationsAchievedGeneric2.Enabled = false;
                    CertificationsAchievedGeneric3.Enabled = false;

                    CertificationsAchievedManagement2.Enabled = false;
                    CertificationsAchievedManagement3.Enabled = false;

                    CertificationsAchievedProduct2.Enabled = false;
                    CertificationsAchievedProduct3.Enabled = false;

                    KnowledgeSharingSessions2.Enabled = false;
                    KnowledgeSharingSessions3.Enabled = false;

                    WhitePapers2.Enabled = false;
                    WhitePapers3.Enabled = false;

                    SelfMotivating2.Enabled = false;
                    SelfMotivating3.Enabled = false;

                    Attitude2.Enabled = false;
                    Attitude3.Enabled = false;

                    Commitment2.Enabled = false;
                    Commitment3.Enabled = false;

                    Communication2.Enabled = false;
                    Communication3.Enabled = false;

                    SkillImprovisation2.Enabled = false;
                    SkillImprovisation3.Enabled = false;

                    Promotion.Visible = false;
                    reviewerTable.Visible = false;
                }
                else if (type1 == 1)
                {
                    SelfAssessment0.Enabled = false;
                    FinalizedRating.Enabled = false;

                    Newskillacq0.Enabled = false;
                    Newskillacq1.Enabled = false;

                    InnovativeThoughts0.Enabled = false;
                    InnovativeThoughts1.Enabled = false;

                    CertificationsAchievedGeneric0.Enabled = false;
                    CertificationsAchievedGeneric1.Enabled = false;

                    CertificationsAchievedManagement0.Enabled = false;
                    CertificationsAchievedManagement1.Enabled = false;

                    CertificationsAchievedProduct0.Enabled = false;
                    CertificationsAchievedProduct1.Enabled = false;

                    KnowledgeSharingSessions0.Enabled = false;
                    KnowledgeSharingSessions1.Enabled = false;

                    WhitePapers0.Enabled = false;
                    WhitePapers1.Enabled = false;

                    SelfMotivating0.Enabled = false;
                    SelfMotivating1.Enabled = false;

                    Attitude0.Enabled = false;
                    Attitude1.Enabled = false;

                    Commitment0.Enabled = false;
                    Commitment1.Enabled = false;

                    Communication0.Enabled = false;
                    Communication1.Enabled = false;

                    SkillImprovisation0.Enabled = false;
                    SkillImprovisation1.Enabled = false;

                    reviewerTable.Visible = false;
                    Promotion.Visible = false;
                }

            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal2";
                    log.Method = "DisableControls";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }

        public void Save()
        {
            try
            {
                EmpSkills_t empSkill = null;
                empSkills = Session["empSkills"] as List<EmpSkills_t>;
                PerformanceAppEntities db = null;
                string Empskills = "";
                string Empprojects = "";
                empId = emp[0].Emp_Id;

                if (empSkills != null)
                {
                    //empSkill = empSkills.Where(m => m.Type == 11).Single();
                    using (db = new PerformanceAppEntities())
                    {
                        var query1 = db.EmpSkills_t.Where(m => m.Type == 11 && m.EmpId == empId);
                        if (query1.Count() != 0)
                        {
                            empSkill = query1.Single();
                            empSkill.Self_Rating = Newskillacq0.SelectedValue;
                            empSkill.SelfComments = Newskillacq1.Text;
                            empSkill.App_Rating = Newskillacq2.SelectedValue;
                            empSkill.AppComments = Newskillacq3.Text;
                            
                            Empskills = empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 11;

                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (Newskillacq0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = Newskillacq0.SelectedValue;
                                    empSkill.SelfComments = Newskillacq1.Text;
                                    empSkill.App_Rating = Newskillacq2.SelectedValue;
                                    empSkill.AppComments = Newskillacq3.Text;
                                    Empskills = empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 11;
                                    empSkill.RoleId = Skills[0].RoleId;
                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }
                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {

                        if (Newskillacq0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = Newskillacq0.SelectedValue;
                            empSkill.SelfComments = Newskillacq1.Text;
                            empSkill.App_Rating = Newskillacq2.SelectedValue;
                            empSkill.AppComments = Newskillacq3.Text;
                            Empskills = empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 11;
                            empSkill.RoleId = Skills[0].RoleId;
                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }





                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query2 = db.EmpSkills_t.Where(m => m.Type == 12 && m.EmpId == empId);
                        if (query2.Count() != 0)
                        {
                            empSkill = query2.Single();
                            empSkill.Self_Rating = SkillImprovisation0.SelectedValue;
                            empSkill.SelfComments = SkillImprovisation1.Text;
                            empSkill.App_Rating = SkillImprovisation2.SelectedValue;
                            empSkill.AppComments = SkillImprovisation3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 12;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (SkillImprovisation0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = SkillImprovisation0.SelectedValue;
                                    empSkill.SelfComments = SkillImprovisation1.Text;
                                    empSkill.App_Rating = SkillImprovisation2.SelectedValue;
                                    empSkill.AppComments = SkillImprovisation3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 12;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (SkillImprovisation0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = SkillImprovisation0.SelectedValue;
                            empSkill.SelfComments = SkillImprovisation1.Text;
                            empSkill.App_Rating = SkillImprovisation2.SelectedValue;
                            empSkill.AppComments = SkillImprovisation3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 12;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }

                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query3 = db.EmpSkills_t.Where(m => m.Type == 13 && m.EmpId == empId);
                        if (query3.Count() != 0)
                        {
                            empSkill = query3.Single();
                            empSkill.Self_Rating = InnovativeThoughts0.SelectedValue;
                            empSkill.SelfComments = InnovativeThoughts1.Text;
                            empSkill.App_Rating = InnovativeThoughts2.SelectedValue;
                            empSkill.AppComments = InnovativeThoughts3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 13;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (InnovativeThoughts0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = InnovativeThoughts0.SelectedValue;
                                    empSkill.SelfComments = InnovativeThoughts1.Text;
                                    empSkill.App_Rating = InnovativeThoughts2.SelectedValue;
                                    empSkill.AppComments = InnovativeThoughts3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 13;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (InnovativeThoughts0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = InnovativeThoughts0.SelectedValue;
                            empSkill.SelfComments = InnovativeThoughts1.Text;
                            empSkill.App_Rating = InnovativeThoughts2.SelectedValue;
                            empSkill.AppComments = InnovativeThoughts3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 13;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }

                    }
                }

                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query4 = db.EmpSkills_t.Where(m => m.Type == 21 && m.EmpId == empId);
                        if (query4.Count() != 0)
                        {
                            empSkill = query4.Single();
                            empSkill.Self_Rating = CertificationsAchievedGeneric0.SelectedValue;
                            empSkill.SelfComments = CertificationsAchievedGeneric1.Text;
                            empSkill.App_Rating = CertificationsAchievedGeneric2.SelectedValue;
                            empSkill.AppComments = CertificationsAchievedGeneric3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 21;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (CertificationsAchievedGeneric0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = CertificationsAchievedGeneric0.SelectedValue;
                                    empSkill.SelfComments = CertificationsAchievedGeneric1.Text;
                                    empSkill.App_Rating = CertificationsAchievedGeneric2.SelectedValue;
                                    empSkill.AppComments = CertificationsAchievedGeneric3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 21;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (CertificationsAchievedGeneric0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = CertificationsAchievedGeneric0.SelectedValue;
                            empSkill.SelfComments = CertificationsAchievedGeneric1.Text;
                            empSkill.App_Rating = CertificationsAchievedGeneric2.SelectedValue;
                            empSkill.AppComments = CertificationsAchievedGeneric3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 21;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }

                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query5 = db.EmpSkills_t.Where(m => m.Type == 22 && m.EmpId == empId);
                        if (query5.Count() != 0)
                        {
                            if (CertificationsAchievedProduct0.SelectedValue != "")
                            {
                                empSkill = query5.Single();
                                empSkill.Self_Rating = CertificationsAchievedProduct0.SelectedValue;
                                empSkill.SelfComments = CertificationsAchievedProduct1.Text;
                                empSkill.App_Rating = CertificationsAchievedProduct2.SelectedValue;
                                empSkill.AppComments = CertificationsAchievedProduct3.Text;
                                Empskills += empSkill.SkillId.ToString() + ";";
                                empSkill.EmpId = emp[0].Emp_Id;
                                empSkill.Type = 22;
                                empSkill.RoleId = Skills[0].RoleId;
                                if (empSkills == null)
                                    db.EmpSkills_t.Add(empSkill);
                                db.SaveChanges();
                            }
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (CertificationsAchievedProduct0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = CertificationsAchievedProduct0.SelectedValue;
                                    empSkill.SelfComments = CertificationsAchievedProduct1.Text;
                                    empSkill.App_Rating = CertificationsAchievedProduct2.SelectedValue;
                                    empSkill.AppComments = CertificationsAchievedProduct3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 22;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (CertificationsAchievedProduct0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = CertificationsAchievedProduct0.SelectedValue;
                            empSkill.SelfComments = CertificationsAchievedProduct1.Text;
                            empSkill.App_Rating = CertificationsAchievedProduct2.SelectedValue;
                            empSkill.AppComments = CertificationsAchievedProduct3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 22;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }


                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query6 = db.EmpSkills_t.Where(m => m.Type == 23 && m.EmpId == empId);
                        if (query6.Count() != 0)
                        {
                            empSkill = query6.Single();
                            empSkill.Self_Rating = CertificationsAchievedManagement0.SelectedValue;
                            empSkill.SelfComments = CertificationsAchievedManagement1.Text;
                            empSkill.App_Rating = CertificationsAchievedManagement2.SelectedValue;
                            empSkill.AppComments = CertificationsAchievedManagement3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 23;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (CertificationsAchievedManagement0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = CertificationsAchievedManagement0.SelectedValue;
                                    empSkill.SelfComments = CertificationsAchievedManagement1.Text;
                                    empSkill.App_Rating = CertificationsAchievedManagement2.SelectedValue;
                                    empSkill.AppComments = CertificationsAchievedManagement3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 23;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (CertificationsAchievedManagement0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = CertificationsAchievedManagement0.SelectedValue;
                            empSkill.SelfComments = CertificationsAchievedManagement1.Text;
                            empSkill.App_Rating = CertificationsAchievedManagement2.SelectedValue;
                            empSkill.AppComments = CertificationsAchievedManagement3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 23;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }

                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query7 = db.EmpSkills_t.Where(m => m.Type == 31 && m.EmpId == empId);
                        if (query7.Count() != 0)
                        {
                            empSkill = query7.Single();
                            empSkill.Self_Rating = KnowledgeSharingSessions0.SelectedValue;
                            empSkill.SelfComments = KnowledgeSharingSessions1.Text;
                            empSkill.App_Rating = KnowledgeSharingSessions2.SelectedValue;
                            empSkill.AppComments = KnowledgeSharingSessions3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 31;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (KnowledgeSharingSessions0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = KnowledgeSharingSessions0.SelectedValue;
                                    empSkill.SelfComments = KnowledgeSharingSessions1.Text;
                                    empSkill.App_Rating = KnowledgeSharingSessions2.SelectedValue;
                                    empSkill.AppComments = KnowledgeSharingSessions3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 31;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (KnowledgeSharingSessions0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = KnowledgeSharingSessions0.SelectedValue;
                            empSkill.SelfComments = KnowledgeSharingSessions1.Text;
                            empSkill.App_Rating = KnowledgeSharingSessions2.SelectedValue;
                            empSkill.AppComments = KnowledgeSharingSessions3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 31;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }

                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query8 = db.EmpSkills_t.Where(m => m.Type == 32 && m.EmpId == empId);
                        if (query8.Count() != 0)
                        {
                            empSkill = query8.Single();
                            empSkill.Self_Rating = WhitePapers0.SelectedValue;
                            empSkill.SelfComments = WhitePapers1.Text;
                            empSkill.App_Rating = WhitePapers2.SelectedValue;
                            empSkill.AppComments = WhitePapers3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 32;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (WhitePapers0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = WhitePapers0.SelectedValue;
                                    empSkill.SelfComments = WhitePapers1.Text;
                                    empSkill.App_Rating = WhitePapers2.SelectedValue;
                                    empSkill.AppComments = WhitePapers3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 32;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (WhitePapers0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = WhitePapers0.SelectedValue;
                            empSkill.SelfComments = WhitePapers1.Text;
                            empSkill.App_Rating = WhitePapers2.SelectedValue;
                            empSkill.AppComments = WhitePapers3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 32;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }

                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query9 = db.EmpSkills_t.Where(m => m.Type == 41 && m.EmpId == empId);
                        if (query9.Count() != 0)
                        {
                            empSkill = query9.Single();
                            empSkill.Self_Rating = SelfMotivating0.SelectedValue;
                            empSkill.SelfComments = SelfMotivating1.Text;
                            empSkill.App_Rating = SelfMotivating2.SelectedValue;
                            empSkill.AppComments = SelfMotivating3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 41;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (SelfMotivating0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = SelfMotivating0.SelectedValue;
                                    empSkill.SelfComments = SelfMotivating1.Text;
                                    empSkill.App_Rating = SelfMotivating2.SelectedValue;
                                    empSkill.AppComments = SelfMotivating3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 41;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (SelfMotivating0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = SelfMotivating0.SelectedValue;
                            empSkill.SelfComments = SelfMotivating1.Text;
                            empSkill.App_Rating = SelfMotivating2.SelectedValue;
                            empSkill.AppComments = SelfMotivating3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 41;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }

                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query10 = db.EmpSkills_t.Where(m => m.Type == 42 && m.EmpId == empId);
                        if (query10.Count() != 0)
                        {
                            empSkill = query10.Single();
                            empSkill.Self_Rating = Attitude0.SelectedValue;
                            empSkill.SelfComments = Attitude1.Text;
                            empSkill.App_Rating = Attitude2.SelectedValue;
                            empSkill.AppComments = Attitude3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 42;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (Attitude0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = Attitude0.SelectedValue;
                                    empSkill.SelfComments = Attitude1.Text;
                                    empSkill.App_Rating = Attitude2.SelectedValue;
                                    empSkill.AppComments = Attitude3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 42;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (Attitude0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = Attitude0.SelectedValue;
                            empSkill.SelfComments = Attitude1.Text;
                            empSkill.App_Rating = Attitude2.SelectedValue;
                            empSkill.AppComments = Attitude3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 42;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }

                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query11 = db.EmpSkills_t.Where(m => m.Type == 43 && m.EmpId == empId);
                        if (query11.Count() != 0)
                        {
                            empSkill = query11.Single();
                            empSkill.Self_Rating = Commitment0.SelectedValue;
                            empSkill.SelfComments = Commitment1.Text;
                            empSkill.App_Rating = Commitment2.SelectedValue;
                            empSkill.AppComments = Commitment3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 43;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (Commitment0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = Commitment0.SelectedValue;
                                    empSkill.SelfComments = Commitment1.Text;
                                    empSkill.App_Rating = Commitment2.SelectedValue;
                                    empSkill.AppComments = Commitment3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 43;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (Commitment0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = Commitment0.SelectedValue;
                            empSkill.SelfComments = Commitment1.Text;
                            empSkill.App_Rating = Commitment2.SelectedValue;
                            empSkill.AppComments = Commitment3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 43;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }

                empSkill = new EmpSkills_t();
                if (empSkills != null)
                {
                    using (db = new PerformanceAppEntities())
                    {
                        var query12 = db.EmpSkills_t.Where(m => m.Type == 44 && m.EmpId == empId);
                        if (query12.Count() != 0)
                        {
                            empSkill = query12.Single();
                            empSkill.Self_Rating = Communication0.SelectedValue;
                            empSkill.SelfComments = Communication1.Text;
                            empSkill.App_Rating = Communication2.SelectedValue;
                            empSkill.AppComments = Communication3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 44;
                            empSkill.RoleId = Skills[0].RoleId;
                            if (empSkills == null)
                                db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                        else
                        {
                            using (db = new PerformanceAppEntities())
                            {
                                if (Communication0.SelectedValue != "")
                                {
                                    empSkill = new EmpSkills_t();
                                    empSkill.SkillId = Guid.NewGuid();
                                    empSkill.Self_Rating = Communication0.SelectedValue;
                                    empSkill.SelfComments = Communication1.Text;
                                    empSkill.App_Rating = Communication2.SelectedValue;
                                    empSkill.AppComments = Communication3.Text;
                                    Empskills += empSkill.SkillId.ToString() + ";";
                                    empSkill.EmpId = emp[0].Emp_Id;
                                    empSkill.Type = 44;
                                    empSkill.RoleId = Skills[0].RoleId;

                                    db.EmpSkills_t.Add(empSkill);
                                    db.SaveChanges();
                                }
                            }
                        }
                    }

                }
                else
                {
                    using (db = new PerformanceAppEntities())
                    {
                        if (Communication0.SelectedValue != "")
                        {
                            empSkill = new EmpSkills_t();
                            empSkill.SkillId = Guid.NewGuid();
                            empSkill.Self_Rating = Communication0.SelectedValue;
                            empSkill.SelfComments = Communication1.Text;
                            empSkill.App_Rating = Communication2.SelectedValue;
                            empSkill.AppComments = Communication3.Text;
                            Empskills += empSkill.SkillId.ToString() + ";";
                            empSkill.EmpId = emp[0].Emp_Id;
                            empSkill.Type = 44;
                            empSkill.RoleId = Skills[0].RoleId;

                            db.EmpSkills_t.Add(empSkill);
                            db.SaveChanges();
                        }
                    }
                }


               
                    using (PerformanceAppEntities db1 = new PerformanceAppEntities())
                    {
                        Appraisal_t appraisals = new Appraisal_t();
                        if (appraisal != null)
                        {
                            appraisals = db1.Appraisal_t.Where(m => m.EmpId == empId).Single();
                        }
                        else
                            appraisals.AppId = Guid.NewGuid();
                        appraisals.EmpId = emp[0].Emp_Id;
                        //appraisals.EmpProjects = Session["EmpProjectId"] as String;
                        appraisals.EmpSkills = Empskills;
                        appraisals.SelfOverall = SelfAssessment0.SelectedValue;
                        appraisals.AssessorOverAll = AssessorRating0.SelectedValue;
                        appraisals.FinalOverAll = FinalizedRating.SelectedValue;
                        appraisals.RecPromotion = RecommendedforPromotion0.Text;
                        appraisals.NotPromoting = notpromoting0.Text;
                        if (DateSelfAssessment0.Text != "")
                            appraisals.DoAssessment = Convert.ToDateTime(DateSelfAssessment0.Text);
                        if (AssessmentDiscussion0.Text != "")
                            appraisals.DoAssessmentDisc = Convert.ToDateTime(AssessmentDiscussion0.Text);
                        else

                            if (AssessorCompletion0.Text != "")
                                appraisals.DoAssessorCompletion = Convert.ToDateTime(AssessorCompletion0.Text);
                        if (Finalization0.Text != "")
                            appraisals.DoFinalization = Convert.ToDateTime(Finalization0.Text);
                        appraisals.Understanding = Session["Understanding"] as String;
                        appraisals.Responsibility = Session["Responsibility"] as String;
                        appraisals.From = Convert.ToDateTime(Session["From"] as String);
                        appraisals.To = Convert.ToDateTime(Session["To"] as String);
                        appraisals.Weightage = Weightage0.Text;
                        appraisals.SkillRevRating = ReviewerRating.SelectedValue;
                        appraisals.SkillRevComment = ReviewerComment.Text;
                        if (appraisal == null)
                            db1.Appraisal_t.Add(appraisals);
                        db1.SaveChanges();
                        if (appraisal == null)
                Finish.Text = "Saved Successfully";
            else
                Finish.Text = "Updated Successfully";

                    }
                }catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal2";
                    log.Method = "Save";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }
    
           
            
        

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
                Session["isSaved"] = 1;
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    var query = db.Appraisal_t.Where(m => m.EmpId == empId);

                    if (query.Count() != 0)
                    {
                        Appraisal_t app_raisal = query.Single();
                        app_raisal.Status = 1;
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal2";
                    log.Method = "btnSave_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
                Session["isSaved"] = 1;
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    var query = db.Appraisal_t.Where(m => m.EmpId == empId);

                    if (query.Count() != 0)
                    {
                        Appraisal_t app_raisal = query.Single();
                        int appId = emp[0].Appraiser ?? 0;
                        var query1 = db.Employee_t.Where(m => m.Emp_Id == appId);
                        Employee_t appEmail = query1.Single();
                        int revId = emp[0].Reviewer ?? 0;
                        var query2 = db.Employee_t.Where(m => m.Emp_Id == revId);
                        Employee_t revEmail = query2.Single();
                        string Subject = "";
                        string Body = "";
                        if (type == 0)
                        {
                            app_raisal.Status = 2;
                            if (appEmail != null)
                            {
                                //To Self..
                                Subject = " Thank you for submission";
                                Body = "<html><body>Dear " + emp[0].Firstname + ",<br/> Thank you for submitting your Appraisal form. Your appraisal form is now pending with your appraiser.</body></html>";
                                SendMail(emp[0].Email, Subject, Body);

                                //To Appraiser..
                                Subject = "Pending Appraisal";
                                Body = "<html><body>Dear "+appEmail.Firstname+""+appEmail.Lastname+",<br/> The employee, "+emp[0].Firstname+" "+emp[0].Lastname+" has submitted the appraisal form. Please review the same</body></html>";
                                SendMail(appEmail.Email, Subject, Body);
                            }

                        }
                        else if (type == 1)
                        {
                            app_raisal.Status = 3;
                            if (appEmail != null)
                            {
                                //To Self..
                                Subject = "Appraisal completed. Review Pending";
                                Body = "<html><body>Dear " + emp[0].Firstname + ",<br/> Your appraisal form has been filled by your appraiser.<br/> Please check your appraisal form <a href=\"http://localhost:51848/Login.aspx\">here</a>. Reviewing your appraisal form by your reviewer is pending.</body></html>";
                                SendMail(emp[0].Email, Subject, Body);

                                //To Appraiser..
                                Subject = "Thank you for the Appraisal";
                                Body = "<html><body>Dear "+appEmail.Firstname+" "+appEmail.Lastname+",<br/> Thank you for appraising Mr."+emp[0].Firstname+" "+emp[0].Lastname+".";
                                SendMail(appEmail.Email, Subject, Body);

                                //To Reviewer..
                                Subject = "Pending for Review";
                                Body = "<html><body>Dear "+revEmail.Firstname+" "+revEmail.Lastname+",<br/> Review for Mr."+emp[0].Firstname+" "+emp[0].Lastname+" is pending. Please review for the same</body></html>";
                                SendMail(revEmail.Email, Subject, Body);
                            }
                        }
                        else if (type == 2)
                        {
                            app_raisal.Status = 4;
                            if (appEmail != null)
                            {
                                //To Self..
                                Subject = "Review Completed";
                                Body = "<html><body>Dear " + emp[0].Firstname + ",<br/> Your appraisal form has been reviewed. please check your appraisal form <a href=\"http://localhost:51848/Login.aspx\">here</a>.</body></html>";
                                SendMail(emp[0].Email, Subject, Body);

                                //To Reviewer..
                                Subject = "Thank you for the review";
                                Body = "<html><body>Dear "+revEmail.Firstname+" "+revEmail.Lastname+",<br/> Thank you for reviewing Mr."+emp[0].Firstname+" "+emp[0].Lastname+".</body></html>";
                                SendMail(revEmail.Email, Subject, Body);
                            }
                        }
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal2";
                    log.Method = "btnSubmit_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
           }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Performance Appraisal.aspx",false);
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal2";
                    log.Method = "btnClose_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }

        public void LoadControls()
        {
            try
            {
                empProject = new List<EmpProject_t>();
                KeyAchievePro = new List<EmpProject_t>();
                AreaAchieves = new List<EmpProject_t>();
                AreaDones = new List<EmpProject_t>();
                empSkills = new List<EmpSkills_t>();
                int empId = emp[0].Emp_Id;
                if (appraisal != null)
                {
                    if (appraisal.EmpSkills != null)
                    {
                        ReviewerRating.SelectedValue = appraisal.SkillRevRating;
                        ReviewerComment.Text = appraisal.SkillRevComment;
                        string[] Skills = appraisal.EmpSkills.Split(';');

                        for (int i = 0; i < Skills.Length - 1; i++)
                        {
                            Guid SkillsId = Guid.Parse(Skills[i]);
                            using (PerformanceAppEntities db = new PerformanceAppEntities())
                            {
                                empSkills.Add(db.EmpSkills_t.Where(m => m.SkillId == SkillsId && m.EmpId == empId).ToList().Single());
                            }

                        }
                        Session["empSkills"] = empSkills;
                        foreach (var item2 in empSkills)
                        {
                            if (item2.Type == 11)
                            {
                                Newskillacq0.SelectedValue = item2.Self_Rating.ToString();
                                Newskillacq1.Text = item2.SelfComments;
                                Newskillacq2.SelectedValue = item2.App_Rating.ToString();
                                Newskillacq3.Text = item2.AppComments;
                            }
                            if (item2.Type == 12)
                            {
                                SkillImprovisation0.SelectedValue = item2.Self_Rating.ToString();
                                SkillImprovisation1.Text = item2.SelfComments;
                                SkillImprovisation2.SelectedValue = item2.App_Rating.ToString();
                                SkillImprovisation3.Text = item2.AppComments;
                            }
                            if (item2.Type == 13)
                            {
                                InnovativeThoughts0.SelectedValue = item2.Self_Rating.ToString();
                                InnovativeThoughts1.Text = item2.SelfComments;
                                InnovativeThoughts2.SelectedValue = item2.App_Rating.ToString();
                                InnovativeThoughts3.Text = item2.AppComments;
                            }
                            if (item2.Type == 21)
                            {
                                CertificationsAchievedGeneric0.SelectedValue = item2.Self_Rating.ToString();
                                CertificationsAchievedGeneric1.Text = item2.SelfComments;
                                CertificationsAchievedGeneric2.SelectedValue = item2.App_Rating.ToString();
                                CertificationsAchievedGeneric3.Text = item2.AppComments;
                            }
                            if (item2.Type == 22)
                            {
                                CertificationsAchievedManagement0.SelectedValue = item2.Self_Rating.ToString();
                                CertificationsAchievedManagement1.Text = item2.SelfComments;
                                CertificationsAchievedManagement2.SelectedValue = item2.App_Rating.ToString();
                                CertificationsAchievedManagement3.Text = item2.AppComments;
                            }
                            if (item2.Type == 23)
                            {
                                CertificationsAchievedProduct0.SelectedValue = item2.Self_Rating.ToString();
                                CertificationsAchievedProduct1.Text = item2.SelfComments;
                                CertificationsAchievedProduct2.SelectedValue = item2.App_Rating.ToString();
                                CertificationsAchievedProduct3.Text = item2.AppComments;
                            }
                            if (item2.Type == 31)
                            {
                                KnowledgeSharingSessions0.SelectedValue = item2.Self_Rating.ToString();
                                KnowledgeSharingSessions1.Text = item2.SelfComments;
                                KnowledgeSharingSessions2.SelectedValue = item2.App_Rating.ToString();
                                KnowledgeSharingSessions3.Text = item2.AppComments;
                            }
                            if (item2.Type == 32)
                            {
                                WhitePapers0.SelectedValue = item2.Self_Rating.ToString();
                                WhitePapers1.Text = item2.SelfComments;
                                WhitePapers2.SelectedValue = item2.App_Rating.ToString();
                                WhitePapers3.Text = item2.AppComments;
                            }
                            if (item2.Type == 41)
                            {
                                SelfMotivating0.SelectedValue = item2.Self_Rating.ToString();
                                SelfMotivating1.Text = item2.SelfComments;
                                SelfMotivating2.SelectedValue = item2.App_Rating.ToString();
                                SelfMotivating3.Text = item2.AppComments;
                            }
                            if (item2.Type == 42)
                            {
                                Attitude0.SelectedValue = item2.Self_Rating.ToString();
                                Attitude1.Text = item2.SelfComments;
                                Attitude2.SelectedValue = item2.App_Rating.ToString();
                                Attitude3.Text = item2.AppComments;
                            }
                            if (item2.Type == 43)
                            {
                                Commitment0.SelectedValue = item2.Self_Rating.ToString();
                                Commitment1.Text = item2.SelfComments;
                                Commitment2.SelectedValue = item2.App_Rating.ToString();
                                Commitment3.Text = item2.AppComments;
                            }
                            if (item2.Type == 44)
                            {
                                Communication0.SelectedValue = item2.Self_Rating.ToString();
                                Communication1.Text = item2.SelfComments;
                                Communication2.SelectedValue = item2.App_Rating.ToString();
                                Communication3.Text = item2.AppComments;
                            }
                            if (item2.Type == 45)
                            {
                                TotalRating0.Text = item2.Self_Rating.ToString();
                                TotalRating2.Text = item2.App_Rating.ToString();
                            }



                            DateTime selfAssessment = appraisal.DoAssessment ?? DateTime.Now;
                            if (selfAssessment != DateTime.Parse("1753-01-01 00:00:00"))
                                DateSelfAssessment0.Text = selfAssessment.ToString("dd-MM-yyyy");

                            DateTime AssessmentDiscussion = appraisal.DoAssessmentDisc ?? DateTime.Now;
                            if (AssessmentDiscussion != DateTime.Parse("1753-01-01 00:00:00"))
                                AssessmentDiscussion0.Text = AssessmentDiscussion.ToString("dd-MM-yyyy");

                            DateTime AssessmentCompletion = appraisal.DoAssessorCompletion ?? DateTime.Now;
                            if (AssessmentCompletion != DateTime.Parse("1753-01-01 00:00:00"))
                                AssessorCompletion0.Text = AssessmentCompletion.ToString("dd-MM-yyyy");

                            DateTime finalization = appraisal.DoFinalization ?? DateTime.Now;
                            if (finalization != DateTime.Parse("1753-01-01 00:00:00"))
                                Finalization0.Text = finalization.ToString("dd-MM-yyyy");
                            SelfAssessment0.SelectedValue = appraisal.SelfOverall;
                            AssessorRating0.SelectedValue = appraisal.AssessorOverAll;
                            FinalizedRating.SelectedValue = appraisal.FinalOverAll;
                            RecommendedforPromotion0.Text = appraisal.RecPromotion;
                            notpromoting0.Text = appraisal.NotPromoting;
                            Weightage0.Text = appraisal.Weightage;
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal2";
                    log.Method = "LoadControls";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
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
                Response.Redirect("~/Login.aspx?logout=1",false);
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal2";
                    log.Method = "logout_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }

        public bool SendMail(string toAddress, string Subject, string Body)
        {
            MailMessage mail = new MailMessage();
            var fromAddress = "iggugan@gmail.com";// Gmail Address from where you send the mail
            mail.To.Add(toAddress);
            const string fromPassword = "Veenag18";//Password of your gmail address
            mail.Subject = Subject;
            mail.IsBodyHtml = true;
            mail.Body = Body;
            mail.From = new MailAddress("iggugan@gmail.com");
            AlternateView av = AlternateView.CreateAlternateViewFromString(mail.Body, null, MediaTypeNames.Text.Html);
            LinkedResource lr = new LinkedResource("E:\\trans.jpg", MediaTypeNames.Image.Jpeg);
            lr.ContentId = "image1";
            av.LinkedResources.Add(lr);
            mail.AlternateViews.Add(av);
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            smtp.Send(mail);
            return true;
        }
        
    }
}