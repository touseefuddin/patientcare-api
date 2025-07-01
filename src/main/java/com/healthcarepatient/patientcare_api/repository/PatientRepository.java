package com.healthcarepatient.patientcare_api.repository;

import com.healthcarepatient.patientcare_api.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientRepository extends JpaRepository<Patient, Long> {
}

