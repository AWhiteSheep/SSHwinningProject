﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//     Version du runtime :4.0.30319.42000
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Inscription
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="SSHdataBase")]
	public partial class AtelierDataDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Définitions de méthodes d'extensibilité
    partial void OnCreated();
    partial void InsertDonneesActivites(DonneesActivites instance);
    partial void UpdateDonneesActivites(DonneesActivites instance);
    partial void DeleteDonneesActivites(DonneesActivites instance);
    partial void InsertTags(Tags instance);
    partial void UpdateTags(Tags instance);
    partial void DeleteTags(Tags instance);
    partial void InsertDonneesAtelier(DonneesAtelier instance);
    partial void UpdateDonneesAtelier(DonneesAtelier instance);
    partial void DeleteDonneesAtelier(DonneesAtelier instance);
    partial void InsertEtudiant(Etudiant instance);
    partial void UpdateEtudiant(Etudiant instance);
    partial void DeleteEtudiant(Etudiant instance);
    #endregion
		
		public AtelierDataDataContext() : 
				base(global::Inscription.Properties.Settings.Default.ConnectionStringToDonneesActivite, mappingSource)
		{
			OnCreated();
		}
		
		public AtelierDataDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public AtelierDataDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public AtelierDataDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public AtelierDataDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<DonneesActivites> DonneesActivites
		{
			get
			{
				return this.GetTable<DonneesActivites>();
			}
		}
		
		public System.Data.Linq.Table<Tags> Tags
		{
			get
			{
				return this.GetTable<Tags>();
			}
		}
		
		public System.Data.Linq.Table<Ateliers_Tags> Ateliers_Tags
		{
			get
			{
				return this.GetTable<Ateliers_Tags>();
			}
		}
		
		public System.Data.Linq.Table<DonneesAtelier> DonneesAteliers
		{
			get
			{
				return this.GetTable<DonneesAtelier>();
			}
		}
		
		public System.Data.Linq.Table<Etudiant> Etudiants
		{
			get
			{
				return this.GetTable<Etudiant>();
			}
		}
		
		public System.Data.Linq.Table<Etudiant_Atelier> Etudiant_Ateliers
		{
			get
			{
				return this.GetTable<Etudiant_Atelier>();
			}
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.GetAllAteliersByTag", IsComposable=true)]
		public IQueryable<GetAllAteliersByTagResult> GetAllAteliersByTag([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Tags", DbType="VarChar(25)")] string tags)
		{
			return this.CreateMethodCallQuery<GetAllAteliersByTagResult>(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), tags);
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.GetAllAteliersByStudent", IsComposable=true)]
		public IQueryable<GetAllAteliersByStudentResult> GetAllAteliersByStudent([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Etudiant", DbType="Int")] System.Nullable<int> etudiant)
		{
			return this.CreateMethodCallQuery<GetAllAteliersByStudentResult>(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), etudiant);
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.DonneesActivites")]
	public partial class DonneesActivites : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _NumActivite;
		
		private string _contentTitle;
		
		private string _Campus;
		
		private string _Salle;
		
		private string _contentInfo;
		
		private System.Data.Linq.Binary _poster;
		
		private string _contentMain;
		
		private string _TitreCoupOeil;
		
    #region Définitions de méthodes d'extensibilité
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnNumActiviteChanging(string value);
    partial void OnNumActiviteChanged();
    partial void OncontentTitleChanging(string value);
    partial void OncontentTitleChanged();
    partial void OnCampusChanging(string value);
    partial void OnCampusChanged();
    partial void OnSalleChanging(string value);
    partial void OnSalleChanged();
    partial void OncontentInfoChanging(string value);
    partial void OncontentInfoChanged();
    partial void OnposterChanging(System.Data.Linq.Binary value);
    partial void OnposterChanged();
    partial void OncontentMainChanging(string value);
    partial void OncontentMainChanged();
    partial void OnTitreCoupOeilChanging(string value);
    partial void OnTitreCoupOeilChanged();
    #endregion
		
		public DonneesActivites()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NumActivite", DbType="VarChar(10) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string NumActivite
		{
			get
			{
				return this._NumActivite;
			}
			set
			{
				if ((this._NumActivite != value))
				{
					this.OnNumActiviteChanging(value);
					this.SendPropertyChanging();
					this._NumActivite = value;
					this.SendPropertyChanged("NumActivite");
					this.OnNumActiviteChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contentTitle", DbType="VarChar(50)")]
		public string contentTitle
		{
			get
			{
				return this._contentTitle;
			}
			set
			{
				if ((this._contentTitle != value))
				{
					this.OncontentTitleChanging(value);
					this.SendPropertyChanging();
					this._contentTitle = value;
					this.SendPropertyChanged("contentTitle");
					this.OncontentTitleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Campus", DbType="VarChar(50)")]
		public string Campus
		{
			get
			{
				return this._Campus;
			}
			set
			{
				if ((this._Campus != value))
				{
					this.OnCampusChanging(value);
					this.SendPropertyChanging();
					this._Campus = value;
					this.SendPropertyChanged("Campus");
					this.OnCampusChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Salle", DbType="VarChar(50)")]
		public string Salle
		{
			get
			{
				return this._Salle;
			}
			set
			{
				if ((this._Salle != value))
				{
					this.OnSalleChanging(value);
					this.SendPropertyChanging();
					this._Salle = value;
					this.SendPropertyChanged("Salle");
					this.OnSalleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contentInfo", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string contentInfo
		{
			get
			{
				return this._contentInfo;
			}
			set
			{
				if ((this._contentInfo != value))
				{
					this.OncontentInfoChanging(value);
					this.SendPropertyChanging();
					this._contentInfo = value;
					this.SendPropertyChanged("contentInfo");
					this.OncontentInfoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_poster", DbType="Image", UpdateCheck=UpdateCheck.Never)]
		public System.Data.Linq.Binary poster
		{
			get
			{
				return this._poster;
			}
			set
			{
				if ((this._poster != value))
				{
					this.OnposterChanging(value);
					this.SendPropertyChanging();
					this._poster = value;
					this.SendPropertyChanged("poster");
					this.OnposterChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contentMain", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string contentMain
		{
			get
			{
				return this._contentMain;
			}
			set
			{
				if ((this._contentMain != value))
				{
					this.OncontentMainChanging(value);
					this.SendPropertyChanging();
					this._contentMain = value;
					this.SendPropertyChanged("contentMain");
					this.OncontentMainChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TitreCoupOeil", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string TitreCoupOeil
		{
			get
			{
				return this._TitreCoupOeil;
			}
			set
			{
				if ((this._TitreCoupOeil != value))
				{
					this.OnTitreCoupOeilChanging(value);
					this.SendPropertyChanging();
					this._TitreCoupOeil = value;
					this.SendPropertyChanged("TitreCoupOeil");
					this.OnTitreCoupOeilChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Tags")]
	public partial class Tags : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _Description;
		
    #region Définitions de méthodes d'extensibilité
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnDescriptionChanging(string value);
    partial void OnDescriptionChanged();
    #endregion
		
		public Tags()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Description", DbType="VarChar(25) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string Description
		{
			get
			{
				return this._Description;
			}
			set
			{
				if ((this._Description != value))
				{
					this.OnDescriptionChanging(value);
					this.SendPropertyChanging();
					this._Description = value;
					this.SendPropertyChanged("Description");
					this.OnDescriptionChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Ateliers_Tags")]
	public partial class Ateliers_Tags
	{
		
		private System.Nullable<int> _NumAtelier;
		
		private string _Description;
		
		public Ateliers_Tags()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NumAtelier", DbType="Int")]
		public System.Nullable<int> NumAtelier
		{
			get
			{
				return this._NumAtelier;
			}
			set
			{
				if ((this._NumAtelier != value))
				{
					this._NumAtelier = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Description", DbType="VarChar(25)")]
		public string Description
		{
			get
			{
				return this._Description;
			}
			set
			{
				if ((this._Description != value))
				{
					this._Description = value;
				}
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.DonneesAteliers")]
	public partial class DonneesAtelier : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _NumAtelier;
		
		private string _contentTitle;
		
		private string _campus;
		
		private string _Salle;
		
		private string _contentInfo;
		
		private string _contentMain;
		
		private string _sommaire;
		
		private System.Nullable<System.DateTime> _dateDebut;
		
		private System.Nullable<int> _Max_Eleves;
		
		private string _posterPath;
		
		private System.Nullable<System.TimeSpan> _HeureDebut;
		
		private System.Nullable<System.TimeSpan> _HeureFin;
		
		private string _Conferencier;
		
    #region Définitions de méthodes d'extensibilité
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnNumAtelierChanging(int value);
    partial void OnNumAtelierChanged();
    partial void OncontentTitleChanging(string value);
    partial void OncontentTitleChanged();
    partial void OncampusChanging(string value);
    partial void OncampusChanged();
    partial void OnSalleChanging(string value);
    partial void OnSalleChanged();
    partial void OncontentInfoChanging(string value);
    partial void OncontentInfoChanged();
    partial void OncontentMainChanging(string value);
    partial void OncontentMainChanged();
    partial void OnsommaireChanging(string value);
    partial void OnsommaireChanged();
    partial void OndateDebutChanging(System.Nullable<System.DateTime> value);
    partial void OndateDebutChanged();
    partial void OnMax_ElevesChanging(System.Nullable<int> value);
    partial void OnMax_ElevesChanged();
    partial void OnposterPathChanging(string value);
    partial void OnposterPathChanged();
    partial void OnHeureDebutChanging(System.Nullable<System.TimeSpan> value);
    partial void OnHeureDebutChanged();
    partial void OnHeureFinChanging(System.Nullable<System.TimeSpan> value);
    partial void OnHeureFinChanged();
    partial void OnConferencierChanging(string value);
    partial void OnConferencierChanged();
    #endregion
		
		public DonneesAtelier()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NumAtelier", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int NumAtelier
		{
			get
			{
				return this._NumAtelier;
			}
			set
			{
				if ((this._NumAtelier != value))
				{
					this.OnNumAtelierChanging(value);
					this.SendPropertyChanging();
					this._NumAtelier = value;
					this.SendPropertyChanged("NumAtelier");
					this.OnNumAtelierChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contentTitle", DbType="VarChar(50)")]
		public string contentTitle
		{
			get
			{
				return this._contentTitle;
			}
			set
			{
				if ((this._contentTitle != value))
				{
					this.OncontentTitleChanging(value);
					this.SendPropertyChanging();
					this._contentTitle = value;
					this.SendPropertyChanged("contentTitle");
					this.OncontentTitleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_campus", DbType="VarChar(20)")]
		public string campus
		{
			get
			{
				return this._campus;
			}
			set
			{
				if ((this._campus != value))
				{
					this.OncampusChanging(value);
					this.SendPropertyChanging();
					this._campus = value;
					this.SendPropertyChanged("campus");
					this.OncampusChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Salle", DbType="VarChar(40)")]
		public string Salle
		{
			get
			{
				return this._Salle;
			}
			set
			{
				if ((this._Salle != value))
				{
					this.OnSalleChanging(value);
					this.SendPropertyChanging();
					this._Salle = value;
					this.SendPropertyChanged("Salle");
					this.OnSalleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contentInfo", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string contentInfo
		{
			get
			{
				return this._contentInfo;
			}
			set
			{
				if ((this._contentInfo != value))
				{
					this.OncontentInfoChanging(value);
					this.SendPropertyChanging();
					this._contentInfo = value;
					this.SendPropertyChanged("contentInfo");
					this.OncontentInfoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contentMain", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string contentMain
		{
			get
			{
				return this._contentMain;
			}
			set
			{
				if ((this._contentMain != value))
				{
					this.OncontentMainChanging(value);
					this.SendPropertyChanging();
					this._contentMain = value;
					this.SendPropertyChanged("contentMain");
					this.OncontentMainChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_sommaire", DbType="VarChar(25)")]
		public string sommaire
		{
			get
			{
				return this._sommaire;
			}
			set
			{
				if ((this._sommaire != value))
				{
					this.OnsommaireChanging(value);
					this.SendPropertyChanging();
					this._sommaire = value;
					this.SendPropertyChanged("sommaire");
					this.OnsommaireChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_dateDebut", DbType="SmallDateTime")]
		public System.Nullable<System.DateTime> dateDebut
		{
			get
			{
				return this._dateDebut;
			}
			set
			{
				if ((this._dateDebut != value))
				{
					this.OndateDebutChanging(value);
					this.SendPropertyChanging();
					this._dateDebut = value;
					this.SendPropertyChanged("dateDebut");
					this.OndateDebutChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Max_Eleves", DbType="Int")]
		public System.Nullable<int> Max_Eleves
		{
			get
			{
				return this._Max_Eleves;
			}
			set
			{
				if ((this._Max_Eleves != value))
				{
					this.OnMax_ElevesChanging(value);
					this.SendPropertyChanging();
					this._Max_Eleves = value;
					this.SendPropertyChanged("Max_Eleves");
					this.OnMax_ElevesChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_posterPath", DbType="VarChar(100)")]
		public string posterPath
		{
			get
			{
				return this._posterPath;
			}
			set
			{
				if ((this._posterPath != value))
				{
					this.OnposterPathChanging(value);
					this.SendPropertyChanging();
					this._posterPath = value;
					this.SendPropertyChanged("posterPath");
					this.OnposterPathChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HeureDebut", DbType="Time")]
		public System.Nullable<System.TimeSpan> HeureDebut
		{
			get
			{
				return this._HeureDebut;
			}
			set
			{
				if ((this._HeureDebut != value))
				{
					this.OnHeureDebutChanging(value);
					this.SendPropertyChanging();
					this._HeureDebut = value;
					this.SendPropertyChanged("HeureDebut");
					this.OnHeureDebutChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HeureFin", DbType="Time")]
		public System.Nullable<System.TimeSpan> HeureFin
		{
			get
			{
				return this._HeureFin;
			}
			set
			{
				if ((this._HeureFin != value))
				{
					this.OnHeureFinChanging(value);
					this.SendPropertyChanging();
					this._HeureFin = value;
					this.SendPropertyChanged("HeureFin");
					this.OnHeureFinChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Conferencier", DbType="NVarChar(50)")]
		public string Conferencier
		{
			get
			{
				return this._Conferencier;
			}
			set
			{
				if ((this._Conferencier != value))
				{
					this.OnConferencierChanging(value);
					this.SendPropertyChanging();
					this._Conferencier = value;
					this.SendPropertyChanged("Conferencier");
					this.OnConferencierChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Etudiant")]
	public partial class Etudiant : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Numero_Etudiant;
		
		private System.Data.Linq.Binary _m_Password;
		
		private string _email;
		
		private string _username;
		
    #region Définitions de méthodes d'extensibilité
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnNumero_EtudiantChanging(int value);
    partial void OnNumero_EtudiantChanged();
    partial void Onm_PasswordChanging(System.Data.Linq.Binary value);
    partial void Onm_PasswordChanged();
    partial void OnemailChanging(string value);
    partial void OnemailChanged();
    partial void OnusernameChanging(string value);
    partial void OnusernameChanged();
    #endregion
		
		public Etudiant()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Numero_Etudiant", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int Numero_Etudiant
		{
			get
			{
				return this._Numero_Etudiant;
			}
			set
			{
				if ((this._Numero_Etudiant != value))
				{
					this.OnNumero_EtudiantChanging(value);
					this.SendPropertyChanging();
					this._Numero_Etudiant = value;
					this.SendPropertyChanged("Numero_Etudiant");
					this.OnNumero_EtudiantChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_m_Password", DbType="VarBinary(MAX) NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
		public System.Data.Linq.Binary m_Password
		{
			get
			{
				return this._m_Password;
			}
			set
			{
				if ((this._m_Password != value))
				{
					this.Onm_PasswordChanging(value);
					this.SendPropertyChanging();
					this._m_Password = value;
					this.SendPropertyChanged("m_Password");
					this.Onm_PasswordChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_email", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string email
		{
			get
			{
				return this._email;
			}
			set
			{
				if ((this._email != value))
				{
					this.OnemailChanging(value);
					this.SendPropertyChanging();
					this._email = value;
					this.SendPropertyChanged("email");
					this.OnemailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_username", DbType="VarChar(25) NOT NULL", CanBeNull=false)]
		public string username
		{
			get
			{
				return this._username;
			}
			set
			{
				if ((this._username != value))
				{
					this.OnusernameChanging(value);
					this.SendPropertyChanging();
					this._username = value;
					this.SendPropertyChanged("username");
					this.OnusernameChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Etudiant_Atelier")]
	public partial class Etudiant_Atelier
	{
		
		private System.Nullable<int> _Numero_Etudiant;
		
		private System.Nullable<int> _NumAtelier;
		
		public Etudiant_Atelier()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Numero_Etudiant", DbType="Int")]
		public System.Nullable<int> Numero_Etudiant
		{
			get
			{
				return this._Numero_Etudiant;
			}
			set
			{
				if ((this._Numero_Etudiant != value))
				{
					this._Numero_Etudiant = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NumAtelier", DbType="Int")]
		public System.Nullable<int> NumAtelier
		{
			get
			{
				return this._NumAtelier;
			}
			set
			{
				if ((this._NumAtelier != value))
				{
					this._NumAtelier = value;
				}
			}
		}
	}
	
	public partial class GetAllAteliersByTagResult
	{
		
		private System.Nullable<int> _NumAtelier;
		
		public GetAllAteliersByTagResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NumAtelier", DbType="Int")]
		public System.Nullable<int> NumAtelier
		{
			get
			{
				return this._NumAtelier;
			}
			set
			{
				if ((this._NumAtelier != value))
				{
					this._NumAtelier = value;
				}
			}
		}
	}
	
	public partial class GetAllAteliersByStudentResult
	{
		
		private System.Nullable<int> _NumAtelier;
		
		private string _contentTitle;
		
		private string _campus;
		
		private string _Salle;
		
		private string _contentInfo;
		
		private string _contentMain;
		
		private string _sommaire;
		
		private System.Nullable<System.DateTime> _dateDebut;
		
		private System.Nullable<int> _Max_Eleves;
		
		private string _posterPath;
		
		private System.Nullable<System.TimeSpan> _HeureDebut;
		
		private System.Nullable<System.TimeSpan> _HeureFin;
		
		public GetAllAteliersByStudentResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NumAtelier", DbType="Int")]
		public System.Nullable<int> NumAtelier
		{
			get
			{
				return this._NumAtelier;
			}
			set
			{
				if ((this._NumAtelier != value))
				{
					this._NumAtelier = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contentTitle", DbType="VarChar(50)")]
		public string contentTitle
		{
			get
			{
				return this._contentTitle;
			}
			set
			{
				if ((this._contentTitle != value))
				{
					this._contentTitle = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_campus", DbType="VarChar(20)")]
		public string campus
		{
			get
			{
				return this._campus;
			}
			set
			{
				if ((this._campus != value))
				{
					this._campus = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Salle", DbType="VarChar(40)")]
		public string Salle
		{
			get
			{
				return this._Salle;
			}
			set
			{
				if ((this._Salle != value))
				{
					this._Salle = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contentInfo", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string contentInfo
		{
			get
			{
				return this._contentInfo;
			}
			set
			{
				if ((this._contentInfo != value))
				{
					this._contentInfo = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_contentMain", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string contentMain
		{
			get
			{
				return this._contentMain;
			}
			set
			{
				if ((this._contentMain != value))
				{
					this._contentMain = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_sommaire", DbType="VarChar(25)")]
		public string sommaire
		{
			get
			{
				return this._sommaire;
			}
			set
			{
				if ((this._sommaire != value))
				{
					this._sommaire = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_dateDebut", DbType="SmallDateTime")]
		public System.Nullable<System.DateTime> dateDebut
		{
			get
			{
				return this._dateDebut;
			}
			set
			{
				if ((this._dateDebut != value))
				{
					this._dateDebut = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Max_Eleves", DbType="Int")]
		public System.Nullable<int> Max_Eleves
		{
			get
			{
				return this._Max_Eleves;
			}
			set
			{
				if ((this._Max_Eleves != value))
				{
					this._Max_Eleves = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_posterPath", DbType="VarChar(100)")]
		public string posterPath
		{
			get
			{
				return this._posterPath;
			}
			set
			{
				if ((this._posterPath != value))
				{
					this._posterPath = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HeureDebut", DbType="Time")]
		public System.Nullable<System.TimeSpan> HeureDebut
		{
			get
			{
				return this._HeureDebut;
			}
			set
			{
				if ((this._HeureDebut != value))
				{
					this._HeureDebut = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HeureFin", DbType="Time")]
		public System.Nullable<System.TimeSpan> HeureFin
		{
			get
			{
				return this._HeureFin;
			}
			set
			{
				if ((this._HeureFin != value))
				{
					this._HeureFin = value;
				}
			}
		}
	}
}
#pragma warning restore 1591
