package com.crudunablunes.app.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.crudunablunes.app.entidades.Agenda;

@Repository
public interface RepositorioAgenda extends JpaRepository<Agenda, Long> {
 
}