using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerfApp
{
    public partial class Perfappraisal : System.Web.UI.Page
    {
        public int id = 0;
        public List<Employee_t> emp = null;
        public int empId = 0;
        Objective_t objective = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            emp = Session["Employee"] as List<Employee_t>;
            if (emp != null)
            {
                empId = emp[0].Emp_Id;
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    var query = db.Objective_t.Where(m => m.EmpId == empId);
                    if (query.Count() != 0)
                    {
                        objective = query.Single();
                        id = objective.ObjectiveID;
                    }
                }
            }
            else
                Response.Redirect("~/Login.aspx", false);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        public bool Save()
        {
            try
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                { 
                Objective_t objective = new Objective_t();
                var query=db.Objective_t.Where(m=>m.ObjectiveID==id);
                if (query.Count() != 0)
                {
                    objective = query.Single();
                }
                else
                {
                    objective = new Objective_t();
                }
                objective.Newskillacquired = Newskillacq1.Text;
                objective.LearningPurchasing = Convert.ToDateTime(LearningPurchasing1.Text);
                objective.SkillImprovisationa = SkillImprovisation0.Text;
                objective.SkillImprovisationb = SkillImprovisation1.Text;
                objective.SkillImprovisationc = Convert.ToDateTime(SkillImprovisation2.Text);
                objective.InnovativeThoughts = InnovativeThoughts0.Text;
                objective.Formulatingthedesignforhandling = Convert.ToDateTime(Formulatingthedesignforhandling0.Text);
                objective.CertificationsToBeAchievedGeneric = CertificationsToBeAchievedGeneric0.Text;
                objective.OraclePreSales = Convert.ToDateTime(OraclePreSales0.Text);
                objective.CertificationsToBeAchievedproduct= CertificationsToBeAchievedproduct0.Text;
                objective.OCPINV = Convert.ToDateTime(OCPINV0.Text);
                objective.CertificationsToBeAchievedManagement = CertificationsToBeAchievedManagement0.Text;
                objective.CertificationsToBeAchievedManagementa = CertificationsToBeAchievedManagement1.Text;
                objective.CertificationsToBeAchievedManagementb = Convert.ToDateTime(CertificationsToBeAchievedManagement2.Text);
                objective.KnowledgeSharingSessions = KnowledgeSharingSessions0.Text;
                objective.PrepartaionofIndepth = Convert.ToDateTime(PrepartaionofIndepth0.Text);
                objective.WhitePapers = WhitePapers0.Text;
                objective.ImplementationconsiderationforINV = Convert.ToDateTime(ImplementationconsiderationforINV0.Text);
                objective.SelfMotivating = SelfMotivating0.Text;
                objective.TeamBuilding = Convert.ToDateTime(TeamBuilding0.Text);
                objective.Attitude = Attitude0.Text;
                objective.HighlyPositive = Convert.ToDateTime(HighlyPositive0.Text);
                objective.Commitment = Commitment0.Text;
                objective.CustomerDelight = Convert.ToDateTime(CustomerDelight0.Text);
                objective.Communication = Communication0.Text;
                objective.Communicationa = Communication1.Text;
                objective.Communicationb = Convert.ToDateTime(Communication2.Text);
                objective.Provideyourinput = Provideyourinput0.Text;
                objective.Provideyourinputa = Provideyourinput1.Text;
                objective.Provideyourinputb = Provideyourinput2.Text;
                objective.Provideyourinputc = Provideyourinput3.Text;
                objective.EmpId = empId;

                if (query.Count() == 0)
                {
                    db.Objective_t.Add(objective);
                    db.SaveChanges();
                }
                }
                return true;
            }
            catch(Exception e)
            {
                return false;
            }
                
            
        }
    }
}