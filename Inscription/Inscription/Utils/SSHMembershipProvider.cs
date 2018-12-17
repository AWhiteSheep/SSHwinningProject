using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Security.Cryptography;

namespace Inscription.Utils
{
    public class SSHMembershipProvider : MembershipProvider
    {
       public override MembershipUser CreateUser(string username,
       string password, string email, string passwordQuestion,
       string passwordAnswer, bool isApproved,
       object providerUserKey, out MembershipCreateStatus status)
        {
            AtelierDataDataContext context = new AtelierDataDataContext();

            if (DataInterpretation.GetStudent(username) != null)
            {
                status = MembershipCreateStatus.DuplicateUserName;
                return null;
            }

            else if (context.Etudiants.SingleOrDefault(e => e.email == email) != null)
            {
                status = MembershipCreateStatus.DuplicateEmail;
                return null;
            }

            byte[] hash = DataInterpretation.ComputeHash(password);

            Etudiant newStudent = new Etudiant()
            {
                username = username,
                m_Password = hash,
                email = email
            };

            context.Etudiants.InsertOnSubmit(newStudent);
            context.SubmitChanges();

            status = MembershipCreateStatus.Success;

            return null;
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            AtelierDataDataContext context = new AtelierDataDataContext();

            Etudiant student = context.Etudiants.SingleOrDefault(e => e.Numero_Etudiant == username);

            MembershipUser mu = new MembershipUser(nameof(SSHMembershipProvider), student.Numero_Etudiant,
                                                    )
        }

        public override bool ValidateUser(string username, string password)
        {
            throw new NotImplementedException();
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new NotImplementedException();
        }

        public override string GetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            throw new NotImplementedException();
        }

        public override string ResetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override void UpdateUser(MembershipUser user)
        {
            throw new NotImplementedException();
        }

        public override bool UnlockUser(string userName)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            throw new NotImplementedException();
        }

        public override string GetUserNameByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override int MinRequiredPasswordLength
        {
            get { throw new NotImplementedException(); }
        }

        public override bool RequiresUniqueEmail
        {
            get { throw new NotImplementedException(); }
        }

        public override bool EnablePasswordRetrieval => throw new NotImplementedException();

        public override bool EnablePasswordReset => throw new NotImplementedException();

        public override bool RequiresQuestionAndAnswer => throw new NotImplementedException();

        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override int MaxInvalidPasswordAttempts => throw new NotImplementedException();

        public override int PasswordAttemptWindow => throw new NotImplementedException();

        public override MembershipPasswordFormat PasswordFormat => throw new NotImplementedException();

        public override int MinRequiredNonAlphanumericCharacters => throw new NotImplementedException();

        public override string PasswordStrengthRegularExpression => throw new NotImplementedException();
    }
}