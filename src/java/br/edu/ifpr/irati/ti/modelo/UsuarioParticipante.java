
package br.edu.ifpr.irati.ti.modelo;

import br.ifpr.irati.ti.util.GerarCodigoAcessoPrivado;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

@Entity(name = "usuarioParticipante")
@PrimaryKeyJoinColumn(name = "idUsuario")
@Proxy(lazy = false)
public class UsuarioParticipante  extends Usuario implements Serializable {
    
    @Column(name="senha",nullable = false)
    private String senha;
    
    @Column(name="email", nullable = false, unique=true)
    private String email;
    
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "administradores")
    private List<Competicao> competicoes;
    
    
    @OneToMany(fetch = FetchType.LAZY)    
    private List<Local> locais;
    
    @Column(name="dataNascimento", nullable = false)
    private Date dataNascimento;
    
    @Column(name="cpf", nullable = false)
    private String cpf;
    
    
    
    public UsuarioParticipante() {
    }


    public UsuarioParticipante(int idUsuario, String nome, Date dataNascimento, String cpf ,String email, String senha) {
        super(idUsuario, nome);
        GerarCodigoAcessoPrivado gcap = new GerarCodigoAcessoPrivado();
        this.senha = gcap.criptografar(senha);
        this.email = email;
        this.cpf = cpf;
        this.dataNascimento = dataNascimento;
        this.competicoes = new ArrayList<>();
        this.locais = new ArrayList<>();
    }

    public UsuarioParticipante(String senha, String email, List<Competicao> competicoes, List<Local> locais, int idUsuario, String nome) {
        super(idUsuario, nome);
        GerarCodigoAcessoPrivado gcap = new GerarCodigoAcessoPrivado();
        this.senha = gcap.criptografar(senha);
        this.email = email;
        this.competicoes = competicoes;
        this.locais = locais;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    


    public void adicionarCompeticao(Competicao cp){
        getCompeticoes().add(cp);
    }
    public void removerCompeticao(Competicao cp){
        getCompeticoes().remove(cp);
    }
    
    public void adicionarLocal(Local local){
        this.getLocais().add(local);
    }
    public void removerLocal(Local local){
        this.getLocais().remove(local);
    }

    /**
     * @return the competicoes
     */
    public List<Competicao> getCompeticoes() {
        return competicoes;
    }

    /**
     * @param competicoes the competicoes to set
     */
    public void setCompeticoes(List<Competicao> competicoes) {
        this.competicoes = competicoes;
    }

    /**
     * @return the locais
     */
    public List<Local> getLocais() {
        return locais;
    }

    /**
     * @param locais the locais to set
     */
    public void setLocais(List<Local> locais) {
        this.locais = locais;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        GerarCodigoAcessoPrivado gcap = new GerarCodigoAcessoPrivado();
        String passeuordi = gcap.criptografar(senha);
        this.senha = passeuordi;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
    

    
    
    
    
}
