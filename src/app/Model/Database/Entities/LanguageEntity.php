<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 27.3.19
 * Time: 15:38
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;

/**
 * Class LanguageEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class LanguageEntity
{
    use TIdentificationProperties;

    /**
     * @var string
     * @ORM\Column(type="string", unique=true)
     */
    private $name;

    /**
     * @var string
     * @ORM\Column(type="string", length=2, unique=true)
     */
    private $iso6391;

    public function __construct(string $name, string $iso6391)
    {
        $this->name = $name;
        $this->iso6391 = $iso6391;
    }


    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName(string $name): void
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getIso6391(): string
    {
        return $this->iso6391;
    }

    /**
     * @param string $iso6391
     */
    public function setIso6391(string $iso6391): void
    {
        $this->iso6391 = $iso6391;
    }


}
