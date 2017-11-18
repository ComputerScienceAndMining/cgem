# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def tenpercdev(h)
  h[:fields].each do |v|
    if v[:type] == "number"
      v[:value] = (v[:value] + ((rand < 0.5? 1:-1)) * (v[:value] * 0.2) * rand).round(2)
    end
  end
end

# Clean tables
Picture.delete_all
Parameter.delete_all
LabTest.delete_all
TestTypeVersion.delete_all
TestType.delete_all
TestStatus.delete_all
Specimen.delete_all
SpecimenTypeVersion.delete_all
SpecimenType.delete_all
Sample.delete_all
SampleTypeVersion.delete_all
SampleType.delete_all
WorkOrder.delete_all
WorkOrderStatus.delete_all
User.delete_all
Organisation.delete_all

# Reset postgres auto increments
Picture.connection.execute('ALTER SEQUENCE pictures_id_seq RESTART WITH 1')
Organisation.connection.execute('ALTER SEQUENCE organisations_id_seq RESTART WITH 1')
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
Parameter.connection.execute('ALTER SEQUENCE parameters_id_seq RESTART WITH 1')
WorkOrderStatus.connection.execute('ALTER SEQUENCE work_order_statuses_id_seq RESTART WITH 1')
WorkOrder.connection.execute('ALTER SEQUENCE work_orders_id_seq RESTART WITH 1')
SampleTypeVersion.connection.execute('ALTER SEQUENCE sample_type_versions_id_seq RESTART WITH 1')
SampleType.connection.execute('ALTER SEQUENCE sample_types_id_seq RESTART WITH 1')
Sample.connection.execute('ALTER SEQUENCE samples_id_seq RESTART WITH 1')
SpecimenTypeVersion.connection.execute('ALTER SEQUENCE specimen_type_versions_id_seq RESTART WITH 1')
SpecimenType.connection.execute('ALTER SEQUENCE specimen_types_id_seq RESTART WITH 1')
Specimen.connection.execute('ALTER SEQUENCE specimens_id_seq RESTART WITH 1')
TestStatus.connection.execute('ALTER SEQUENCE test_statuses_id_seq RESTART WITH 1')
TestTypeVersion.connection.execute('ALTER SEQUENCE test_type_versions_id_seq RESTART WITH 1')
TestType.connection.execute('ALTER SEQUENCE test_types_id_seq RESTART WITH 1')
LabTest.connection.execute('ALTER SEQUENCE lab_tests_id_seq RESTART WITH 1')

# Organisations
usach = Organisation.create! name: 'Universidad de Santiago de Chile'
teniente = Organisation.create! name: 'Teniente'

# Users
user_1 = User.create! first_name: 'Danilo', last_name: 'Aburto', email:'danilo.aburto@usach.cl', password: 'danilo123', password_confirmation:'danilo123', role: 0, enabled: true, organisation: usach
user_2 = User.create! first_name: 'Marcos', last_name: 'Villarreal', email:'marcos.villarreal@usach.cl', password: 'marcos123', password_confirmation:'marcos123', role: 400, enabled: true, organisation: teniente
user_3 = User.create! first_name: 'Miguel', last_name: 'Vera', email:'miguel.vera@usach.cl', password: 'miguel123', password_confirmation:'miguel123', role: 300, enabled: true, organisation: usach

# Work Order statuses
wos_creada = WorkOrderStatus.create! name: 'Creada'
WorkOrderStatus.create! name: 'En progreso'
WorkOrderStatus.create! name: 'Finalizada'
WorkOrderStatus.create! name: 'Entregada'

# Work orders
wo_1 = WorkOrder.create! name: 'Pruebas Sondajes Sector Sur Teniente', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: teniente
       WorkOrder.create! name: '2/2017 J3 Determinación de humedad', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: usach
       WorkOrder.create! name: '2/2017 J3 Picnometría', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: usach
       WorkOrder.create! name: '2/2017 J3 Le Chatelier', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: usach
       WorkOrder.create! name: '2/2017 J3 Razón de absorción', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: usach
       WorkOrder.create! name: '2/2017 J3 Esclerometría', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: usach
       WorkOrder.create! name: '2/2017 J3 Carga puntual', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: usach
       WorkOrder.create! name: '2/2017 J3 Velocidad de ondas', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: usach
       WorkOrder.create! name: '2/2017 J3 Tracción indirecta', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: usach
       WorkOrder.create! name: '2/2017 J3 CCNBD', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: usach

# SampleType type
testigo_data = {
  'fields': [
    {
      'name': 'Pozo',
      'type': 'text',
      'mandatory': false,
    },
    {
      'name': 'Caja',
      'type': 'text',
      'mandatory': false,
    },
    {
      'name': 'Profundidad [m]',
      'type': 'number',
      'mandatory': false,
    },
    {
      'name': 'Largo [m]',
      'type': 'number',
      'mandatory': false,
    },
    {
      'name': 'Porcentaje de recuperación [%]',
      'type': 'number',
      'mandatory': false,
    },
    {
      'name': 'Fecha de recepción',
      'type': 'date',
      'mandatory': true,
    },
    {
      'name': 'Protección de muestra',
      'type': 'radio',
      'mandatory': true,
      'alternatives': [
        {'name': 'Cuidado de rutina'},
        {'name': 'Cuidado especial'},
        {'name': 'Cuidado crítico'}
      ]
    },
  ]
}

testigo_data_filled = {
  'fields': [
    {
      'name': 'Pozo',
      'type': 'text',
      'mandatory': false,
      'value': 'Pozo 1'
    },
    {
      'name': 'Caja',
      'type': 'text',
      'mandatory': false,
      'value': 'Caja 1'
    },
    {
      'name': 'Profundidad [m]',
      'type': 'number',
      'mandatory': false,
      'value': 100
    },
    {
      'name': 'Largo [m]',
      'type': 'number',
      'mandatory': false,
      'value': 4
    },
    {
      'name': 'Porcentaje de recuperación [%]',
      'type': 'number',
      'mandatory': false,
      'value': 85
    },
    {
      'name': 'Fecha de recepción',
      'type': 'date',
      'mandatory': true,
      'value': "2016-11-30T03:00:00.000Z"
    },
    {
      'name': 'Protección de muestra',
      'type': 'radio',
      'mandatory': true,
      'alternatives': [
        {'name': 'Cuidado de rutina'},
        {'name': 'Cuidado especial'},
        {'name': 'Cuidado crítico'}
      ],
      'value': 'Cuidado de rutina'
    },
  ]
}

# SampleType type
cilindro_data = {
  'fields': [
    {
      'name': 'Tipo de cilindro',
      'type': 'radio',
      'mandatory': true,
      'alternatives': [
        {'name': 'Probeta'},
        {'name': 'Disco'},
      ]
    },
    {
      'name': 'Diámetro [mm]',
      'type': 'number',
      'mandatory': true,
    },
    {
      'name': 'Altura [mm]',
      'type': 'number',
      'mandatory': true,
    },
    {
      'name': 'Masa [g]',
      'type': 'number',
      'mandatory': false,
    },
    {
      'name': 'Fecha de preparación',
      'type': 'date',
      'mandatory': false,
    },
  ]
}

cilindro_data_filled = {
  'fields': [
    {
      'name': 'Tipo de cilindro',
      'type': 'radio',
      'mandatory': true,
      'alternatives': [
        {'name': 'Probeta'},
        {'name': 'Disco'},
      ],
      'value': 'Probeta',
    },
    {
      'name': 'Diámetro [mm]',
      'type': 'number',
      'mandatory': true,
      'value': 100,
    },
    {
      'name': 'Altura [mm]',
      'type': 'number',
      'mandatory': true,
      'value': 200,
    },
    {
      'name': 'Masa [g]',
      'type': 'number',
      'mandatory': false,
      'value': 54,
    },
    {
      'name': 'Fecha de preparación',
      'type': 'date',
      'mandatory': false,
      'value': "2016-12-30T03:00:00.000Z"
    },
  ]
}

# 
vo_data = {
  'fields': [
    {
      'name': 'Vp [m/s]',
      'type': 'number',
      'mandatory': true,
    },
    {
      'name': 'Vs [m/s]',
      'type': 'number',
      'mandatory': true,
    },
    {
      'name': 'E [GPa]',
      'type': 'number',
      'mandatory': true,
    },
    {
      'name': 'Poisson',
      'type': 'number',
      'mandatory': true,
    }
  ]
}

vo_data_filled = {
  'fields': [
    {
      'name': 'Vp [m/s]',
      'type': 'number',
      'mandatory': true,
      'value': 4853,
    },
    {
      'name': 'Vs [m/s]',
      'type': 'number',
      'mandatory': true,
      'value': 2784,
    },
    {
      'name': 'E [GPa]',
      'type': 'number',
      'mandatory': true,
      'value': 57.96,
    },
    {
      'name': 'Poisson',
      'type': 'number',
      'mandatory': true,
      'value': 0.2,
    }
  ]
}

ccnbd_data = {
  'fields': [
    {
      'name': 'K1c [MPA·m^1/2]',
      'type': 'number',
      'mandatory': true,
    },
    {
      'name': 'Y*min',
      'type': 'number',
      'mandatory': true,
    }
  ]
}

ccnbd_data_filled = {
  'fields': [
    {
      'name': 'K1c [MPA·m^1/2]',
      'type': 'number',
      'mandatory': true,
      'value': 1.17
    },
    {
      'name': 'Y*min',
      'type': 'number',
      'mandatory': true,
      'value': 1.12
    }
  ]
}

testigo = SampleType.create! name: 'Testigo', data: testigo_data
testigo_version = SampleTypeVersion.first

cilindro = SpecimenType.create! name: 'Cilindro', data: cilindro_data
cilindro_version = SpecimenTypeVersion.first

bloque = SpecimenType.create! name: 'Bloque'
bloque_version = SpecimenTypeVersion.first

samples = []
(1..30).each do |num|
  new_sample = Sample.create! code: "T1-S#{num}", remarks: 'Sin observaciones', sample_type: testigo, sample_type_version: testigo_version, work_order: wo_1, data: testigo_data_filled
  samples.append new_sample
end

# Se crean especímenes
specimens = []
samples.each do |sample|
  (1..4).each do |num|
    new_specimen = Specimen.create! code: "#{sample.code}-S#{num}", remarks: 'Sin observaciones', sample: sample, specimen_type: cilindro, specimen_type_version: cilindro_version, prepared_by: user_1, data: cilindro_data_filled
    specimens.append new_specimen
  end
end

# Status de ensayos
ts_creado = TestStatus.create! name: 'Creado', icon: 'pencil', icon_color: '#777777'
ts_progreso = TestStatus.create! name: 'En progreso', icon: 'hourglass-2', icon_color: '#f0ad4e'
ts_finalizado = TestStatus.create! name: 'Finalizado', icon: 'check', icon_color: '#5cb85c'

# Test Types
tt_vo = TestType.create! name: 'Velocidad de onda', description: '', data: vo_data
tt_vo_version = TestTypeVersion.last
tt_ccnbd = TestType.create! name: 'CCNBD', description: '', data: ccnbd_data
tt_ccnbd_version = TestTypeVersion.last

# Se crean ensayos
lab_tests = []
specimens.each do |specimen|
  new_vo_data_filled = tenpercdev(vo_data_filled.clone)
  new_ccnbd_data_filled = tenpercdev(ccnbd_data_filled.clone)

  new_test_1 = LabTest.create! started_at: '2017-8-10 10:12:00.000000', ended_at: '2017-8-10 11:12:00.000000', work_order: wo_1, test_status: ts_finalizado, test_type: tt_vo, test_type_version: tt_vo_version, specimen: specimen, tested_by: user_1, data: vo_data_filled
  new_test_1 = LabTest.create! started_at: '2017-8-10 10:12:00.000000', ended_at: '2017-8-10 11:12:00.000000', work_order: wo_1, test_status: ts_finalizado, test_type: tt_ccnbd, test_type_version: tt_ccnbd_version, specimen: specimen, tested_by: user_1, data: ccnbd_data_filled
end
